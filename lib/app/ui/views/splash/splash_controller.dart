import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.login);
      // Get.offNamed(AppRoutes.home);
      Get.toNamed(AppRoutes.home);
    });
    super.onReady();
  }
}
