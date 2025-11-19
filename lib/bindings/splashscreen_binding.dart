import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/controllers/splashscreeen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashscreeenController());
  }
}
