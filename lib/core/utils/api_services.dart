import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:healthyfood/core/utils/app_storage.dart';

class ApiServices {
  final String baseUrl =
      'https://task5-lina-sulaiman.trainees-mad-s.com/api/auth';

  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    _dio.options.headers['Accept'] = ['application/json'];

    String url = '$baseUrl/$endPoint';
    var response = await _dio.get(url);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic body,
  }) async {
    String? token = await AppStorage.getToken();
    _dio.options.headers['Accept'] = ['application/json'];
    _dio.options.headers['Authorization'] = 'Bearer $token';

    String url = '$baseUrl/$endPoint';

    log('========token:$token========');
    log('======url: $url========');

    var response = await _dio.post(url, data: body);
    return response.data;
  }
}
