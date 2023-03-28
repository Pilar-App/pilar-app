import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizzHome extends StatelessWidget {
  const QuizzHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: titleSignIn(),
    );
  }
}


Widget titleSignIn() {
  return Text(
    'Quizz Cronotipo',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
  );
}
