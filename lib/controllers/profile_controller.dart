import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/routes/routes.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  void logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("token");
    Get.snackbar(
      "Info",
      "Logout berhasil",
      backgroundColor: AppStatic.secondarygreen,
      colorText: AppStatic.neutrallight,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );

    Get.offAllNamed(AppRoutes.splashscreen);
  }
}
