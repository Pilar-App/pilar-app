import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/components/dialog_loading.dart';

class LoginController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.quizzHome, arguments: firebaseAuth.currentUser);
    }
  }

  Future<void> signInWithGoogle() async {
    DialogLoading.showDialog();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      DialogLoading.cancelDialog();
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
    DialogLoading.cancelDialog();
  }
}
