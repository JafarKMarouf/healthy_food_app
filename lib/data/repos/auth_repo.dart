abstract class AuthRepo {
  Future<void> signupImp({
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

  void logout();
}
