import 'package:get/get.dart';
import 'package:healthyfood/core/utils/app_storage.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var file = ''.obs;
  var image = ''.obs;
  final AuthRepoImpl authRepoImpl;
  HomeController({required this.authRepoImpl}) : super();

  @override
  void onInit() async {
    userName.value = await AppStorage.getUserName() ?? '';
    file.value = await AppStorage.getCertificate() ?? '';
    image.value = await AppStorage.getImage() ?? '';
    await refreshToken();
    super.onInit();
  }

  Future<void> refreshToken() async {
    var result = await authRepoImpl.refreshTokenImp();
    result.fold(
      (l) => Get.snackbar('Error', l.errMessage),
      (r) async {
        await AppStorage.removeToken();
        await AppStorage.storeToken(r['access_token']);
      },
    );
  }
}
