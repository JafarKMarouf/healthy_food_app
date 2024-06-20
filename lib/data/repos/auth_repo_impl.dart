import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;
  AuthRepoImpl({required this.apiServices});

  @override
  Future<Either<Response<dynamic>, Map<String, dynamic>>> loginImpl({
    required String email,
    required String mobile,
    required String password,
  }) async {
    try {
      var data = await apiServices.post(
        endPoint: 'login',
        body: {
          'email': email,
          'phone_number': mobile,
          'password': password,
        },
      );
      log('=====data:$data=======');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        log('=====exception:${e.response!.data}=====');
        log('=====status code :${e.response!.statusCode}=====');
        return left(e.response!);
      } else {
        log('========failure:${e.toString()}=======');
        return left(e as Response);
      }
    }
  }

  @override
  void logout() {}

  @override
  Future<void> signupImp({
    required String photo,
    required String username,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String file,
  }) async {
    await apiServices.post(endPoint: 'signup', body: {
      'user_name': username,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'phone_number': mobile,
      'profile_photo': photo,
      'certificate': file,
    });
  }
}
