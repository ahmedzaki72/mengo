import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://mengo1.online/application/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getAllData({
    @required url,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      'Authorization': "Bearer " + token ?? '',
    };

    return await dio.get(url, queryParameters: query ?? null);
  }

  static Future<Response> postDat({
    url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      // 'Authorization': "Bearer " + token ?? '',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postDataWithToken({
    url,
    Map<String, dynamic> query,
    @required  data,
    String token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      'Authorization': "Bearer " + token ?? '',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
