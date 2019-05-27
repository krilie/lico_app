import 'package:flutter/widgets.dart';
import 'package:lico_app/data_storage/kvstorager.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class kvSqliteHelper implements kvStorager {
  // 工厂模式
  factory kvSqliteHelper() => _getInstance();

  static kvSqliteHelper get instance => _getInstance();
  static kvSqliteHelper _instance = new kvSqliteHelper._internal();

  static kvSqliteHelper _getInstance() {
    return _instance;
  }

  kvSqliteHelper._internal() {
    _dbPath = kvSqlitePath();
    _create();
  }

  String _dbPath;

  Database _database;

  String kvSqlitePath() {
    // Get a location using getDatabasesPath
    getDatabasesPath().then((s) {
      String path = join(s, 'sqlite_kv.db');
      return path;
    });
  }

  _create() {
    // open the database
    openDatabase(kvSqlitePath(), version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE kv(key TEXT PRIMARY KEY, value TEXT)');
    }).then((db) {
      _database = db;
    });
  }

  @override
  Future<String> getClientAccToken() {
    return getValue(Keys.clientAccToken);
  }

  @override
  Future<String> getUserId() {
    return getValue(Keys.userId);
  }

  @override
  Future<String> getUserNickName() {
    return getValue(Keys.userNickName);
  }

  @override
  Future<String> getUserToken() {
    return getValue(Keys.userToken);
  }

  @override
  void setClientAccToken(String v) {
    setValue(Keys.clientAccToken, v);
  }

  @override
  void setUserInfo(String nickName, userId, token) {
    setValue(Keys.userNickName, nickName);
    setValue(Keys.userId, userId);
    setValue(Keys.userToken, token);
  }

  @override
  void close() {
    if (_database != null) _database.close();
  }

  @override
  Future<String> getServiceEndPoint() {
    return getValue(Keys.serviceEndPoint);
  }

  @override
  void setServiceEndPoint(String endPoint) async {
    await setValue(Keys.serviceEndPoint,endPoint);
  }
  // 设置值
  void setValue(String key,String value) async {
    await _database.transaction((tx) async {
      var count = Sqflite.firstIntValue(await tx.rawQuery(
          "SELECT COUNT(*) FROM kv where key = ?", [key]));
      if (count == 0) {
        int id2 = await tx.rawInsert('INSERT INTO kv(key, value) VALUES(?, ?)',
            [key, value]);
      } else if (count == 1) {
        int id2 = await tx.rawUpdate('update kv set value=? where key = ?',
            [value,key]);
      } else {
        int id2 = await tx.rawDelete(
            'delete from kv where key = ?', [value, key]);
        int id3 = await tx.rawInsert('INSERT INTO kv(key, value) VALUES(?, ?)',
            [key, value]);
      }
    });
  }
  // 取值
  Future<String> getValue(String key) async {
    var value =await _database.rawQuery("select value from kv where key = ?",[key]);
    if (value.length == 0)
      return "";
    else if(value.length > 0)
      return value[0]["value"];
  }

}
