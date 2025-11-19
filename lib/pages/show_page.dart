import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/components/MyShowItem.dart';
import 'package:pas_mobile_11pplg2_02/controllers/show_controller.dart';

class ShowPage extends StatelessWidget {
  ShowPage({super.key});

  final ShowController controller = Get.find<ShowController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final show = controller.tvshowResponse[index];
                return MyShowItem(
                  image: show.image.medium,
                  title: show.name,
                  type: show.type.name,
                  category: show.language.name,
                  text: "Bookmark",
                  onFavoriteTap: () {
                    controller.addToBookmark(index);
                  },
                );
              },
              itemCount: controller.tvshowResponse.length,
            ),
            onRefresh: () async {
              controller.getTvShow();
            },
          );
        }),
      ),
    );
  }
}
