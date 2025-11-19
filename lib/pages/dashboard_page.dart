import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_02/controllers/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.title[controller.currentIndex.value],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppStatic.primary,
            ),
          ),
          backgroundColor: AppStatic.neutrallight,
          automaticallyImplyLeading: false,
          elevation: 2,
          centerTitle: true,
        ),
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppStatic.neutrallight,
          elevation: 4,
          onTap: controller.changeIndex,
          selectedItemColor: AppStatic.primary2,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_camera_back_sharp,
                color: AppStatic.primary2,
              ),
              label: "Show",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, color: AppStatic.primary2),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: AppStatic.primary2),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
