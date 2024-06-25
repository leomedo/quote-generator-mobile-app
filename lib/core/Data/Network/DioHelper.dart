import 'package:dio/dio.dart';

import 'EndPoints.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get(
      {required String endPoint,
        Map<String, dynamic>? body,
        Map<String, dynamic>? params}) async {
    try {
      Response? response =
      await dio?.get(endPoint, data: body, queryParameters: params);
      return response!;
    } catch (e) {
      rethrow;
    }
  }
}