import 'package:get/get.dart';
import 'package:healthyfood/core/utils/app_storage.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var file = ''.obs;
  var image = ''.obs;

  @override
  void onInit() async {
    userName.value = await AppStorage.getUserName() ?? '';
    file.value = await AppStorage.getCertificate() ?? '';
    image.value = await AppStorage.getImage() ?? '';
    super.onInit();
  }
}
