import 'package:dio/dio.dart';

class DioHelper {
  static var dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String lang = 'ar',
    String? token,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
