import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_02/components/MyButton.dart';
import 'package:pas_mobile_11pplg2_02/components/MyTextField.dart';
import 'package:pas_mobile_11pplg2_02/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/routes/routes.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
              SizedBox(height: 16),

              MyTextField(label: "Full Name", controller: controller.fullName),

              SizedBox(height: 16),

              MyTextField(label: "Email", controller: controller.email),

              SizedBox(height: 24),

              Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : MyButton(
                        text: "Register",
                        textcolor: Colors.white,
                        backgroundcolor: AppStatic.primary,
                        onPressed: () {
                          controller.register();
                        },
                      ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah Punya Akun? "),
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.loginPage);
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
