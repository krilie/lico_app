import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:lico_app/data_storage/kvstorage.dart';
import 'http_api_model.dart';

var HeaderClientAccToken = "ClientAccToken"; // for header client access token
var HeaderAuthorization = "Authorization"; //for authorization

class api {
  // 工厂模式
  factory api() => _getInstance();

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

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        if (options.headers == null)
          options.headers = {
            HeaderClientAccToken: "123",
          };
        else
          options.headers[HeaderClientAccToken] = "234";
      },
      onError: (DioError e) {
        if(e.response.statusCode == 500){
          var msg = StdRet.fromJson(e.response.data);
          debugPrint(e.response.statusCode.toString()+msg.code+msg.message);
        }
        return e.response;
      },
      onResponse: (Response e) {},
    ));
  }

  void setErrorInterceptor(Interceptor int) {
    dio.interceptors.add(int);
  }

  Future<T> _Post<T extends Ret>(
    String path, {
    bool withToken = true,
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    T t;
    if (options == null) options = new Options();
    if (options.headers == null) options.headers = Map<String, dynamic>();
    if (withToken)
      options.headers[HeaderAuthorization] = "234";
    dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress).then((o){
      return t.loadJson(o.data);
    }).catchError((o){
      debugPrint(o);
    });
  }

  Future<T> _Get<T extends Ret>(
    String path, {
    bool withToken = true,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    T t;
    if (options == null) options = new Options();
    if (options.headers == null) options.headers = Map<String, dynamic>();
    if (withToken)
      options.headers[HeaderAuthorization] = "456";
    dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress).then((o){
      return t.loadJson(o.data);
    }).catchError((o){
      debugPrint(o);
    });
  }

// login
  Future<UserLoginRet> userLogin(String userName, String password) async {
    FormData form = FormData();
    form.add("login_name", userName);
    form.add("password", password);
    return await _Post("/api/user/login", data: form, withToken: false);
  }

  // logout
  Future<StdRet> userLogout(String token) async {
    return await _Post("/api/user/logout", withToken: true);
  }



}
