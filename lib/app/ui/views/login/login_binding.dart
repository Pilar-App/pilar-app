import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
