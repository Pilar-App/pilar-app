import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/components/dialog_loading.dart';
import 'package:pilar_app/app/ui/views/login/login_controller.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
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

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void logout() async {
    DialogLoading.showDialog();
    await loginController.googleSignIn.disconnect();
    await loginController.firebaseAuth.signOut();
    DialogLoading.cancelDialog();
    Get.offAllNamed(AppRoutes.splash);
  }
}
