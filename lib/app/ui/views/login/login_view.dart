import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

Future<void> signInWithGoogle() async {
  //todo, ketool para obtener certificaciones de fingerprint en Firebase Config profile
  // Create an instance of the firebase auth and google signin
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
  // Create a new credentials
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  // Sign in the user with the credentials
  final UserCredential userCredential =
      await auth.signInWithCredential(credential);
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgLogin(context),
    );
  }
}

Widget bgLogin(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: const AssetImage('assets/images/signin_bg.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.darken)),
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
        btnSigInGoogle(context),
      ],
    )),
  );
}

Widget btnSigInGoogle(BuildContext context) {
  return MaterialButton(
      splashColor: Colors.transparent,
      minWidth: double.infinity,
      height: 60,
      color: const Color(0xFF33C9F2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
      onPressed: () async {
        await signInWithGoogle();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => NavigationView()));
      });
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
