import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/login/login_controller.dart';

class QuizzController extends GetxController {
  LoginController loginController = Get.find<LoginController>();
  late User user;

  @override
  void onInit() async {
    //
    user = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {}
}
