import 'package:get/get.dart';

validate({
  required String value,
  required String type,
  min,
  max,
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
    if (!GetUtils.isImage(value)) {
      return 'not valid image';
    }
  }
  if (type == 'file') {
    if (!GetUtils.isPDF(value) && !GetUtils.isWord(value)) {
      return 'not valid file';
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
