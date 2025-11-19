import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreeenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 5));

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    if (token != null) {
      Get.offAllNamed(AppRoutes.dashboardPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
