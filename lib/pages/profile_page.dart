import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_02/components/MyButton.dart';
import 'package:pas_mobile_11pplg2_02/controllers/profile_controller.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStatic.neutrallight,
      body: Column(
        children: [
          // HEADER DENGAN GRADIENT
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                colors: [AppStatic.primary, AppStatic.primary2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/108268684?v=4",
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Ageng Seno Jati",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppStatic.neutrallight,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          // EMAIL DAN INFO LAIN
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email, color: AppStatic.primary2),
                      SizedBox(width: 10),
                      Text(
                        "senojati16@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppStatic.primary2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // TOMBOL LOGOUT
                SizedBox(
                  width: double.infinity,
                  child: MyButton(
                    text: "Logout",
                    backgroundcolor: AppStatic.secondary2,
                    textcolor: AppStatic.neutrallight,
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text("Konfirmasi Logout"),
                          content: Text("Kamu yakin ingin logout?"),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text("Tidak"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.logout();
                              },
                              child: Text("Iya"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
