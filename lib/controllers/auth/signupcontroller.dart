// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class SignupController extends GetxController {
  void signup();

  void goToLogin();

  void goToVerify();

  bool validate();

  Future uploadImage({required String uploadType});

  void uploadCertificate();
}

class SignupControllerImp extends SignupController {
  RxBool visible1 = true.obs;
  RxBool visible2 = true.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;

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
    File? selectedImage;
  final returnedImage = uploadType == 'camera'
        ? await ImagePicker().pickImage(source: ImageSource.camera)
        : await ImagePicker().pickImage(source: ImageSource.gallery);

    selectedImage = returnedImage != null
        ? File(returnedImage.path)
        : File('No Image selected ');

    return selectedImage;
  }

  @override
  void uploadCertificate() {
    log('=====================upload Certificate=====================');
  }
}
