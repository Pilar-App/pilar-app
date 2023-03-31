import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/components/dialog_loading.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_controller.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  // LoginController loginController = Get.find<LoginController>();
  QuizzController quizzController = Get.find<QuizzController>();
  // LoginController loginController = Get.put<LoginController>(LoginController());
  late GoogleSignIn googleSignIn;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // late User user;
  late User user;

  @override
  void onInit() async {
    //
    // user = Get.arguments;
    user = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    googleSignIn = GoogleSignIn();
    super.onReady();
  }

  @override
  void onClose() {}

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void logout() async {
    DialogLoading.showDialog();
    await googleSignIn.disconnect();
    await firebaseAuth.signOut();
    DialogLoading.cancelDialog();
    Get.offAllNamed(AppRoutes.splash);
  }
}
