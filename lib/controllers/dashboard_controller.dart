import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/pages/bookmark_show_page.dart';
import 'package:pas_mobile_11pplg2_02/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_02/pages/show_page.dart';

class DashboardController extends GetxController {
  final currentIndex = 0.obs;
  final pages = [ShowPage(), BookmarkShowPage(), ProfilePage()];
  final title = ["TV Show", "Bookmark Show", "Profile"];
  void changeIndex(int i) => currentIndex.value = i;
}
