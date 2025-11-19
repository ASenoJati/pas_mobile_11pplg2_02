import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/controllers/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_02/controllers/profile_controller.dart';
import 'package:pas_mobile_11pplg2_02/controllers/show_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ShowController>(() => ShowController());
  }
}
