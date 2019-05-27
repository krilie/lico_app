
import 'package:lico_app/data_storage/sqlitestorage.dart';
import 'package:lico_app/data_storage/static_kv_storage.dart';

class Keys{
  static final userNickName = "user_nick_name";
  static final userId = "user_id";
  static final userToken = "user_token";
  static final clientAccToken = "client_acc_token";
}

abstract class kvStorager{
  void setUserInfo(String nickName,userId,token);
  Future<String> getUserNickName();
  Future<String> getClientAccToken();
  void setClientAccToken(String v);
  Future<String> getUserToken();
  Future<String> getUserId();
  Future<String> getHostPort();
  void setHostPort(String hostPort);
  void close();
}

// 使用这个
//kvStorager kvstorage  = kvSqliteHelper.instance;
kvStorager kvstorage  = StaticKvStorage();