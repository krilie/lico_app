import 'package:dio/dio.dart';

// or new Dio with a BaseOptions instance.
BaseOptions options = new BaseOptions(
  baseUrl: "https://api.ligo.ml",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio ligoDio = new Dio(options);

void getHttp() async {
  try {
    Response response = await Dio().get("http://www.google.com");
    print(response);
  } catch (e) {
    print(e);
  }
}