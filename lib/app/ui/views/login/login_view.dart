import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/signin_bg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            titleSignIn(),
            const SizedBox(
              height: 260,
            ),
            descriptionSignIn(),
            const SizedBox(
              height: 100,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: const Color.fromRGBO(37, 138, 216, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              onPressed: () async {
                await controller.signInWithGoogle();
              },
            ),
          ],
        )),
      ),
    );
  }
}

Widget titleSignIn() {
  return const Text(
    'The time to act is now',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget descriptionSignIn() {
  return const Text(
    'Your path is laid out before you. Having started, you already took the most difficult step on your way to managing your energy. We will guide you through this path.',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  );
}
