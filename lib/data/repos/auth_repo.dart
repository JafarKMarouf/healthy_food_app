import 'package:dartz/dartz.dart';
import 'package:healthyfood/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> signupImp({
    required String photo,
    required String username,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String file,
  });

  Future<void> loginImpl({
    required String email,
    required String mobile,
    required String password,
  });

  void logoutImp();
}
