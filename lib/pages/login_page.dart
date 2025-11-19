import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_02/components/MyButton.dart';
import 'package:pas_mobile_11pplg2_02/components/MyTextField.dart';
import 'package:pas_mobile_11pplg2_02/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/routes/routes.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(label: "Username", controller: controller.username),

            SizedBox(height: 16),

            MyTextField(
              label: "Password",
              controller: controller.password,
              obscureText: true,
            ),

            SizedBox(height: 24),

            Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MyButton(
                      text: "Login",
                      textcolor: Colors.white,
                      backgroundcolor: AppStatic.primary,
                      onPressed: () {
                        controller.login();
                      },
                    ),
            ),

            SizedBox(height: 20),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum Punya Akun? "),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.registerPage);
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
