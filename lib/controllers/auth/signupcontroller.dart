import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class SignupController extends GetxController {
  void signup();

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

  @override
  void goToLogin() {
    Get.offNamed('login');
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
    Get.toNamed('verify');
  }

  @override
  void signup() {
    log('=====================Signed Up Sucessfully=====================');
  }

  @override
  Future uploadImage({required String uploadType}) async {
    var returnedImage = uploadType == 'camera'
        ? await ImagePicker().pickImage(source: ImageSource.camera)
        : await ImagePicker().pickImage(source: ImageSource.gallery);

    var xreturnedImage =
        returnedImage != null ? File(returnedImage.path).toString() : null;

    update();
    return xreturnedImage;
  }

  @override
  Future uploadCertificate() async {
    final FilePickerResult? filePickerResult =
        await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    update();
    return filePickerResult == null ? filePickerResult!.files.single.path : '';
  }
}
