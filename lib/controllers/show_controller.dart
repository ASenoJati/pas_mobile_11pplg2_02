import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_02/helper/db_helper.dart';
import 'package:pas_mobile_11pplg2_02/models/tv_show_model.dart';
import 'package:pas_mobile_11pplg2_02/routes/static.dart';

class ShowController extends GetxController {
  var isLoading = false.obs;
  var tvshowResponse = <TvShow>[].obs;
  var tvshowMark = <TvShow>[].obs;
  final db = DBHelper();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getTvShow();
    getMarkShow();
  }

  void getTvShow() async {
    final url = Uri.parse("${AppStatic.BASE_URL_TV}/shows");

    try {
      isLoading.value = true;

      final res = await http.get(url);

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List productData = data;

        print("TV Show ${productData}");

        tvshowResponse.assignAll(
          productData.map((e) => TvShow.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          "Status ${res.statusCode}",
          "Gagal Mengambil Data",
          backgroundColor: AppStatic.secondary2,
          colorText: AppStatic.neutrallight,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Info",
        e.toString(),
        backgroundColor: AppStatic.secondary2,
        colorText: AppStatic.neutrallight,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void addToBookmark(int i) async {
    final show = tvshowResponse[i];
    print("Data TV Show : ${show.name}");

    await db.markShow({
      'image': show.image.medium,
      'title': show.name,
      'type': show.type.name,
      'language': show.language.name,
    });

    Get.snackbar(
      'TV Show',
      'TV Show Berhasil Di Bookmark',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppStatic.secondarygreen,
      colorText: AppStatic.neutrallight,
      duration: Duration(seconds: 1),
    );

    getMarkShow();
  }

  void getMarkShow() async {
    final mapList = await db.getMarkShow();
    final list = mapList.map((row) => TvShow.fromDb(row)).toList();
    tvshowMark.assignAll(list);
    print("TV Show di dalam bookmark: $list");
  }

  void deleteMarkShow(int i) async {
    final showTv = tvshowMark[i];

    await db.deleteShow(showTv.id);

    Get.snackbar(
      'TV Show',
      'TV Show Berhasil Di Hapus',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppStatic.secondarygreen,
      colorText: AppStatic.neutrallight,
      duration: Duration(seconds: 1),
    );

    print("Hapus Show Bookmark id: ${showTv.id}");

    getMarkShow();
  }
}
