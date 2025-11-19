import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/models/register_model.dart';
import 'package:pas_mobile_11pplg2_02/routes/routes.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();

  var registerResponse = Rxn<RegisterModel>();
  var isLoading = false.obs;

  void register() async {
    final usernameTs = username.text.trim();
    final passwordTs = password.text.trim();
    final fullNameTs = fullName.text.trim();
    final emailTs = email.text.trim();

    final url = Uri.parse("${AppStatic.BASE_URL}/api/latihan/register-user");

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {
          "username": usernameTs,
          "password": passwordTs,
          "full_name": fullNameTs,
          "email": emailTs,
        },
      );

      if (res.statusCode == 200) {
        final RegisterModel registerModel = registerModelFromJson(res.body);
        registerResponse.value = registerModel;

        username.clear();
        password.clear();
        isLoading.value = false;

        Get.snackbar(
          "Register",
          "Register Berhasil, Silahkan Login",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppStatic.secondarygreen,
          colorText: AppStatic.neutrallight,
        );

        Get.offNamed(AppRoutes.loginPage);
      } else {
        Get.snackbar(
          "Register",
          "Register Status: ${res.statusCode}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppStatic.secondary2,
          colorText: AppStatic.neutrallight,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Register",
        "Koneksi Gagal",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppStatic.secondary2,
        colorText: AppStatic.neutrallight,
      );
      print("Error Login: $e");
    } finally {
      isLoading.value == false;
    }
  }
}
