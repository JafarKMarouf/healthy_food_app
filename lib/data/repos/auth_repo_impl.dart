import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthyfood/core/errors/failure.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;
  AuthRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, Map<String, dynamic>>> signupImp({
    required String photo,
    required String username,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String file,
  }) async {
    try {
      // Map<String, dynamic> data = {
      //   'user_name': username,
      //   'email': email,
      //   'password': password,
      //   'password_confirmation': confirmPassword,
      //   'phone_number': mobile,
      //   'profile_photo': MultipartFile.fromFile(photo),
      // };

      var formData = FormData.fromMap({});
      formData.fields.add(MapEntry('user_name', username));
      formData.fields.add(MapEntry('email', email));
      formData.fields.add(MapEntry('password', password));
      formData.fields.add(MapEntry('password_confirmation', confirmPassword));
      formData.fields.add(MapEntry('phone_number', mobile));
      formData.files.add(MapEntry(
        'profile_photo',
        await MultipartFile.fromFile(photo,
            filename:
                "${DateTime.now().millisecondsSinceEpoch}.${photo.split('.').last}"),
      ));

      var result = await apiServices.post(
        endPoint: 'register',
        body: formData,
      );
      return right(result);
    } catch (e) {
      if (e is DioException) {
        log('========${e.response!.data}');
        log('========${e.response!.statusCode}');

        return left(ServerFailure.fromDioError(e));
      } else {
        log('========${e.toString()}');
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> loginImpl({
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
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> logoutImp() async {
    try {
      var data = await apiServices.post(endPoint: 'logout/43');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> confirmCodeImp({
    required String code,
  }) async {
    try {
      var data =
          await apiServices.post(endPoint: 'confirm-code?verify_code=$code');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> resendCodeImp() async {
    try {
      var data = await apiServices.post(endPoint: 'resend-code');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
