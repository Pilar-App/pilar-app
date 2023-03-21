import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
