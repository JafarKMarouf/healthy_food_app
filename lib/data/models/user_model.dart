class UserModel {
  final String username;
  final String email;
  final String mobile;
  final String password;
  final String confirmPassword;
  final String photo;
  final String file;
  const UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.mobile,
    required this.photo,
    required this.file,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) => UserModel(
        username: jsonData['username'],
        email: jsonData['email'],
        password: jsonData['password'],
        confirmPassword: jsonData['confirmPassword'],
        mobile: jsonData['mobile'],
        photo: jsonData['photo'],
        file: jsonData['file'],
      );
}
