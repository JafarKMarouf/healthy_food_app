import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/functions/check_connection.dart';
import 'package:healthyfood/core/utils/app_storage.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/custome_fails.dart';
import 'package:image_cropper/image_cropper.dart';
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

  void getImage(ImageSource imageSource);

  void getFile();
}

class SignupControllerImp extends SignupController {
  RxBool visible1 = true.obs;
  RxBool visible2 = true.obs;
  late RxBool isConn = false.obs;
  final RxBool loading = false.obs;

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

  // pick image
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // crop image
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // compress image
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  // pick file
  var selectedFilePath = ''.obs;
  var selectedFileName = ''.obs;
  var selectedFileSize = ''.obs;

  @override
  void onInit() {
    checkConn();
    super.onInit();
  }

  checkConn() async {
    isConn.value = await checkConnection();
  }

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
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    Get.back();

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";

      // Crop
      final crop = ImageCropper();
      final cropImageFile = await crop.cropImage(
          sourcePath: selectedImagePath.value,
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          "${((File(cropImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";

      // Compress
      final dir = Directory.systemTemp;
      final targetPath = "${dir.absolute.path}/temp.jpg";

      var compressedFile = await FlutterImageCompress.compressAndGetFile(
        cropImagePath.value,
        targetPath,
        quality: 90,
      );

      compressImageSize.value = compressImagePath.value = compressedFile!.path;

      compressImageSize.value =
          "${((File(compressImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";

      imageController!.text = compressedFile.path;
    } else {
      Get.snackbar(
        'Error',
        'No Image selected',
        backgroundColor: AppColors.buttonsColor,
      );
    }
  }

  @override
  void getFile() async {
    final filePicker = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );
    Get.back();

    if (filePicker != null) {
      selectedFilePath.value = filePicker.files.single.path!;
      selectedFileName.value = filePicker.files.single.name;
      selectedFileSize.value =
          "${((File(selectedFilePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";
      fileController!.text = selectedFilePath.value;
    } else {
      Get.snackbar(
        'Error',
        'No File selected',
        backgroundColor: AppColors.buttonsColor,
      );
    }
  }

  @override
  Future<void> signup({
    required String photo,
    required String username,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String file,
  }) async {
    loading.value = true;

    var result = await authRepoImpl.signupImp(
      username: username,
      email: email,
      mobile: mobile,
      password: password,
      confirmPassword: confirmPassword,
      photo: photo,
      file: file,
    );

    loading.value = false;
    result.fold((l) {
      Get.dialog(
        barrierColor: const Color(0xffFFFDFD),
        CustomeFails(message: l.errMessage),
      );
      Future.delayed(
        AppDuration.dialogDuration,
        () => Get.back(),
      );
    }, (r) async {
      await AppStorage.storeToken(r['token']);
      await AppStorage.removeVerify();
      Future.delayed(
        AppDuration.transitionDuration,
        () {
          goToVerify();
        },
      );
      Get.snackbar('success', r['message']);
    });
  }
}
