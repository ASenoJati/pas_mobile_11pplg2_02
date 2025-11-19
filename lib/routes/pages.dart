import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_02/bindings/dashboard_binding.dart';
import 'package:pas_mobile_11pplg2_02/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg2_02/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg2_02/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg2_02/pages/dashboard_page.dart';
import 'package:pas_mobile_11pplg2_02/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_02/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_02/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg2_02/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),

    GetPage(
      name: AppRoutes.dashboardPage,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.registerPage,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
