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
    // TODO: implement getClientAccToken
    return null;
  }

  @override
  Future<String> getUserId() {
    // TODO: implement getUserId
    return null;
  }

  @override
  Future<String> getUserNickName() {
    // TODO: implement getUserNickName
    return null;
  }

  @override
  Future<String> getUserToken() {
    // TODO: implement getUserToken
    return null;
  }

  @override
  void setClientAccToken(String v) {
    // TODO: implement setClientAccToken
  }

  @override
  void setUserInfo(String nickName, userId, token) {
    // TODO: implement setUserInfo
  }

  @override
  void close() {
    if (_database != null) _database.close();
  }

  @override
  Future<String> getHostPort() {
    // TODO: implement getHostPort
    return null;
  }

  @override
  void setHostPort(String hostPort) {
    // TODO: implement setHostPort
  }
}
