
import 'package:lico_app/data_storage/filekvstorage.dart';
import 'package:lico_app/data_storage/static_kv_storage.dart';

class Keys{
  static final userNickName = "user_nick_name";
  static final userId = "user_id";
  static final userToken = "user_token";
  static final clientAccToken = "client_acc_token";
  static final serviceEndPoint = "https://ligo.ml:83";
}

abstract class kvStorager{
  void setUserInfo(String nickName,userId,token);
  Future<String> getUserNickName();
  Future<String> getClientAccToken();
  void setClientAccToken(String v);
  Future<String> getUserToken();
  Future<String> getUserId();
  Future<String> getServiceEndPoint();
  void setServiceEndPoint(String endpoint);
  void close();
}

// 使用这个
//kvStorager kvstorage  = kvSqliteHelper.instance;
kvStorager kvstorage  = StaticKvStorage();