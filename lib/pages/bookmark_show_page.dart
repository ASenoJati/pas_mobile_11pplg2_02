import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/components/MyShowItem.dart';
import 'package:pas_mobile_11pplg2_02/controllers/show_controller.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';

class BookmarkShowPage extends StatelessWidget {
  BookmarkShowPage({super.key});

  final ShowController controller = Get.find<ShowController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.tvshowMark.isEmpty) {
            return Center(
              child: Text(
                "Belum ada data ",
                style: TextStyle(
                  color: AppStatic.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.getMarkShow();
            },
            child: ListView.builder(
              itemCount: controller.tvshowMark.length,
              itemBuilder: (context, index) {
                final show = controller.tvshowMark[index];

                return MyShowItem(
                  image: show.image.medium,
                  title: show.name,
                  type: show.type.name,
                  category: show.language.name,
                  text: "Hapus",
                  buttonCollor: AppStatic.secondary2,
                  prefixIcon: Icon(Icons.delete, color: AppStatic.neutrallight),
                  onFavoriteTap: () {
                    controller.deleteMarkShow(index);
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
