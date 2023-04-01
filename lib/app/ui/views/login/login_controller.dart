import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> handleAuthStateChanged(isLoggedIn) async {
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
    final existDocument = await verifyUser(firebaseAuth.currentUser!);
    if (!existDocument) {
      final docUser = FirebaseFirestore.instance
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid);

      final json = {
        "uid": firebaseAuth.currentUser!.uid,
        "formChronotype": false,
      };

      await docUser.set(json);
    }
    DialogLoading.cancelDialog();
  }

  Future<bool> verifyUser(User user) async {
    AggregateQuerySnapshot docUser = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: user.uid)
        .count()
        .get();

    final response = docUser.count;

    if (response == 1) {
      return true;
    }

    return false;
  }
}
