import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'http_api.g.dart';

// =================================================================
@JsonSerializable()
class UserLoginRet {
  String token;
  UserLoginRet(this.token);
  factory UserLoginRet.fromJson(Map<String,dynamic> json) => _$UserLoginRetFromJson(json);
  Map<String,dynamic> toJson()=>_$UserLoginRetToJson(this);
}

class api {
  // 工厂模式
  factory api() =>_getInstance();
  static api get instance => _getInstance();
  static api _instance = new api._internal();
  static api _getInstance() {
    return _instance;
  }

  // or new Dio with a BaseOptions instance.
  BaseOptions options;
  Dio dio;
  api._internal() {
    options = new BaseOptions(
      baseUrl: "https://api.ligo.ml",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
  }
  void setErrorInterceptor(Interceptor int){
    dio.interceptors.add(int);
  }
  // login
  Future<UserLoginRet> Userlogin(String userName,String password) async {
    try {
      Response response = await dio.post("/login",data: {"":""});
      print(response);
    } catch (e) {
      print(e);
    }
  }


}
