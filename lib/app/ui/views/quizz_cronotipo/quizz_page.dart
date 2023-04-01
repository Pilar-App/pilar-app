import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/classes/question.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/classes/quiz.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_controller.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/widgets/getImage.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int totalQuestions = 18;
  String chronotypeAnimal = '';
  late String chronotypeAnimalFileName;
  late int totalOptions;
  int posAnswer = 0;
  int questionIndex = 0;
  int progressIndex = 0;
  Quiz quiz = Quiz(name: 'TEST CHRONOTYPE', questions: []);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/JSON/cronotypeQA.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];

    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      List<dynamic> answerList = data[answer]['answers'];
      totalOptions = answerList.length;

      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<List<dynamic>> answerOptions = [];

      List<dynamic> ansTemp = data[answer]['answers'];
      answerOptions.add(ansTemp);

      Question question = Question.fromJson(data[answer]);
      question.addOptions(answerOptions);
      quiz.questions.add(question);

      if (quiz.questions.length >= totalQuestions) break;
    }

    setState(() {});
  }

  Future saveChronotype({
    required String chronotypePar,
    required String uid,
  }) async {
    final docUser = FirebaseFirestore.instance.collection("users").doc(uid);

    await docUser.update({
      'chronotype': chronotypePar,
      'formChronotype': true,
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(Map<String, dynamic> selected) {
    quiz.questions[questionIndex].selected = selected;

    String letterSelected = quiz.questions[questionIndex].selected['letter'];
    int pointsSelected = quiz.questions[questionIndex].selected['points'];

    quiz.score += pointsSelected;

    if (quiz.score >= 16 && quiz.score <= 30) {
      chronotypeAnimal = 'WOLF';
    }
    if (quiz.score >= 42 && quiz.score <= 58) {
      chronotypeAnimal = 'BEAR';
    }
    if (quiz.score >= 70 && quiz.score <= 86) {
      chronotypeAnimal = 'LION';
    }
    if ((quiz.score >= 31 && quiz.score <= 41) ||
        (quiz.score >= 59 && quiz.score <= 69)) {
      chronotypeAnimal = 'DOLPHIN';
    }

    chronotypeAnimalFileName =
        '${chronotypeAnimal.toLowerCase()}_cronotipo_icono.png';

    progressIndex += 1;

    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => _buildResultDialog(context),
      );
    }

    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return GetBuilder<QuizzController>(builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getImageFromFirebaseStorage(chronotypeAnimalFileName),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              'Your chronotype is a $chronotypeAnimal',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // todo: pasar el cronotipo resultado
              saveChronotype(
                chronotypePar: chronotypeAnimal,
                uid: context.user.uid,
              );
              Get.offNamed(
                AppRoutes.navbar,
                arguments: {
                  "user": context.user,
                  "chronotype": chronotypeAnimal,
                },
              );
            },
            child: const Text(
              'Continue',
              style: TextStyle(
                color: Color(0xFF258AD8),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF258AD8),
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: const Color(0xFF258AD8),
        elevation: 0,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                value: progressIndex / totalQuestions,
                minHeight: 20,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 950),
            child: Container(
              // height: 650,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: quiz.questions.isNotEmpty
                  ? Card(
                      color: const Color(0xFF258AD8),
                      elevation: 0.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 20.0,
                            ),
                            child: Text(
                              quiz.questions[questionIndex].question,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalOptions,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    title: Text(
                                      quiz.questions[questionIndex].options[0]
                                          [index]['content'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    onTap: () {
                                      _optionSelected(quiz
                                          .questions[questionIndex]
                                          .options[0][index]);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
