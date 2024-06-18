import 'dart:developer';

import 'package:get/get.dart';

validate({
  required String value,
  required String type,
  min = 8,
  max = 120,
}) {
  if (value.isEmpty) {
    return '$type is required';
  }

  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return 'not valid username';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return 'not valid Email';
    }
  }
  if (type == 'mobile') {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'not valid mobile number';
    }
  }
  if (type == 'image') {
    final RegExp regex = RegExp(r'^.*(.jpg|\.jpeg|\.png|\.gif|\.bmp|\.webp)',
        caseSensitive: false);
    if (!regex.hasMatch(value)) {
      return ("$type should containe jpg|jpeg|png|gif|bmp|webp");
    }
  }
  if (type == 'file') {
    RegExp regex = RegExp(r'^.*(.pdf|\.docx|)', caseSensitive: false);
    if (!regex.hasMatch(value)) {
      return '$type should contain pdf|docx';
    }
  }
  if (type == 'password' || type == 'password confirm') {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!regex.hasMatch(value)) {
      return ("$type should contain upper,lower,digit and Special character ");
    }
  }
  if (type == 'otp_code') {
    if (GetUtils.isNumericOnly(value) && value.length == min) {
      return true;
    }
    return false;
  }
  if (value.length < min) {
    return '$type can\'t be less than $min.';
  }
  if (value.length > max) {
    return '$type can\'t be larger than $max.';
  }
}
