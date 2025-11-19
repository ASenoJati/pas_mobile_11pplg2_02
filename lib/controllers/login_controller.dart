import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_02/routes/static.dart';
import 'package:pas_mobile_11pplg2_02/routes/routes.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  var loginResponse = Rxn<LoginModel>();
  var isLoading = false.obs;

  void login() async {
    final usernameToString = username.text.trim();
    final passwordToString = password.text.trim();
    print("Username : ${usernameToString}");
    print("Password : ${passwordToString}");

    final url = Uri.parse("${AppStatic.BASE_URL}/api/latihan/login");

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {"username": usernameToString, "password": passwordToString},
      );

      if (res.statusCode == 200) {
        final LoginModel loginModel = loginModelFromJson(res.body);
        loginResponse.value = loginModel;

        print("login status : ${loginModel.status}");

        final pref = await SharedPreferences.getInstance();
        pref.setString("token", loginModel.token.toString());

        Get.offNamed(AppRoutes.dashboardPage);
      } else {
        Get.snackbar(
          "Login",
          "Login Gagal: Status ${res.statusCode}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppStatic.secondary2,
          colorText: AppStatic.neutrallight,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Login",
        "Koneksi Gagal",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppStatic.secondary2,
        colorText: AppStatic.neutrallight,
      );

      print("Error Login: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
