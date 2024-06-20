import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:image_picker/image_picker.dart';

abstract class SignupController extends GetxController {
  void signup({
    required String photo,
    required String username,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String file,
  });

  void goToLogin();

  void goToVerify();

  bool validate();

  Future uploadImage({required String uploadType});

  Future uploadCertificate();
}

class SignupControllerImp extends SignupController {
  RxBool visible1 = true.obs;
  RxBool visible2 = true.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController? imageController = TextEditingController();
  final TextEditingController? fileController = TextEditingController();
  final AuthRepoImpl authRepoImpl;
  SignupControllerImp({required this.authRepoImpl}) : super();

  @override
  void goToLogin() {
    Get.offNamed(AppRoutesPage.login);
  }

  @override
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void goToVerify() {
    Get.toNamed(AppRoutesPage.verify);
  }

  @override
  void signup({
    required String photo,
    required String username,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String file,
  }) {
    if (validate()) {
      authRepoImpl.signupImp(
        username: username,
        email: email,
        mobile: mobile,
        password: password,
        confirmPassword: confirmPassword,
        photo: photo,
        file: file,
      );
      // goToVerify();
    } else {
      autoValidate.value = AutovalidateMode.always;
    }
    log('======photo:$photo========');
    log('======username:$username========');
    log('======email:$email========');
    log('======mobile:$mobile========');
    log('======password:$password========');
    log('======confirmPassword:$confirmPassword========');
    log('======file:$file========');
  }

  @override
  Future uploadImage({required String uploadType}) async {
    var returnedImage = uploadType == 'camera'
        ? await ImagePicker().pickImage(source: ImageSource.camera)
        : await ImagePicker().pickImage(source: ImageSource.gallery);

    var xReturnedImage =
        returnedImage != null ? File(returnedImage.path).toString() : null;

    update();
    return xReturnedImage;
  }

  @override
  Future uploadCertificate() async {
    final FilePickerResult? filePickerResult =
        await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    update();
    return filePickerResult != null ? filePickerResult.files.single.name : '';
  }
}
