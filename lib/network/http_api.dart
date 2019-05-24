import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:lico_app/data_storage/kvstorage.dart';
import 'package:oktoast/oktoast.dart';
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
  InterceptorErrorCallback errorCallback;

  api._internal() {
    options = new BaseOptions(
      baseUrl: "https://ligo.ml:83",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        if (options.headers == null)
          options.headers = {
            HeaderClientAccToken: "1234"
          };
        else
          options.headers[HeaderClientAccToken] = "1234";
      },
      onError: (DioError e) {
        var msg = StdRet.fromJson(e.response.data);
        debugPrint(msg.code + msg.message);
        showToast("${msg.code} :${msg.message}");
        return e;
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
    if (withToken) options.headers[HeaderAuthorization] = "234";
    dio
        .post(path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((o) {
      return t.loadJson(o.data);
    }).catchError((o) {
      // 什么也不做
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
    if (withToken) options.headers[HeaderAuthorization] = "456";
    dio
        .get(path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress)
        .then((o) {
      return t.loadJson(o.data);
    }).catchError((o) {
      // 什么也不做
    });
  }

  // login
  Future<UserLoginRet> userLogin(String userName, String password) async {
    return await _Post("/api/user/login", data: {"login_name":userName,"password":password}, withToken: false,options: Options(contentType: ContentType.parse("application/x-www-form-urlencoded")));
  }
  // logout
  Future<StdRet> userLogout(String token) async {
    return await _Post("/api/user/logout", withToken: true);
  }
  // register
  // login
  Future<UserRegisterRet> userRegister(String userName, String password) async {
    return await _Post("/api/user/register", data: {"login_name":userName,"password":password}, withToken: false,options: Options(contentType: ContentType.parse("application/x-www-form-urlencoded")));
  }

}
