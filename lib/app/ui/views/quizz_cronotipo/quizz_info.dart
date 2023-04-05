import 'package:flutter/material.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/classes/quiz.dart';

import 'widgets/get_image.dart';

class QuizzInfo extends StatefulWidget {
  const QuizzInfo({Key? key, required this.quiz}) : super(key: key);
  final Quiz quiz;

  @override
  _QuizzInfoState createState() => _QuizzInfoState();
}

class _QuizzInfoState extends State<QuizzInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Image Test"),
      ),
      body: getImageFromFirebaseStorage('bear_cronotipo_icono.png'),
    );
  }
}
