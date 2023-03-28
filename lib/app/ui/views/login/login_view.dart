import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_home.dart';
import './login_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/signin_bg.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        titleSignIn(),
        SizedBox(
          height: 260,
        ),
        descriptionSignIn(),
        SizedBox(
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
      color: Color(0xFF33C9F2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
        Navigator.push(context,
              MaterialPageRoute(builder: (_) => QuizzHome()));
        
      }
      );
}

Widget titleSignIn() {
  return Text(
    'El momento para actuar es ahora',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget descriptionSignIn() {
  return Text(
    'Tu camino está trazado frente de ti. Al haber empezado, ya diste el paso más dificil en tu camino a la superación personal. Te guiaremos a través de este camino.',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  );
}
