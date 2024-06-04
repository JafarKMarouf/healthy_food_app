import 'package:dio/dio.dart';

class ApiServices {
  final String baseUrl = '';

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
    required dynamic body,
  }) async {
    _dio.options.headers['Accept'] = ['application/json'];
    String url = '$baseUrl/$endPoint';
    var response = await _dio.post(url, data: body);
    return response.data;
  }
}
