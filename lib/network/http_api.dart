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
            HeaderClientAccToken: KvStorage.getClientAccToken()
          };
        else
          options.headers[HeaderClientAccToken] = KvStorage.getClientAccToken();
      },
      onError: (DioError e) {
        print(e.message+e.toString()+e.response.toString());
        return dio.resolve(e.response);
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
      options.headers[HeaderAuthorization] = KvStorage.getUserToken();
    Response response = await dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return t.loadJson(json.decode(response.data));
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
      options.headers[HeaderAuthorization] = KvStorage.getUserToken();
    Response response = await dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return t.loadJson(json.decode(response.data));
  }

// login
  Future<UserLoginRet> userLogin(String userName, String password) async {
    FormData form = FormData();
    form.add("login_name", userName);
    form.add("password", password);
    return await _Post("/api/user/base/login", data: form, withToken: false);
  }

  // logout
  Future<StdRet> userLogout(String token) async {
    return await _Post("/api/user/base/logout", withToken: true);
  }
}
