import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pilar_app/app/ui/views/quizz_cronotipo/classes/quiz.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/classes/question.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_info.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int totalQuestions = 10;
  late int totalOptions;
  int posAnswer = 0;
  int questionIndex = 0;
  int progressIndex = 0;
  Quiz quiz = Quiz(name: 'CRONOTYPE TEST', questions: []);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/JSON/cronotypeQA.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList =
        List<int>.generate(data.length, (i) => i); //[0,1,..., 18]
    List<int> questionsAdded = []; //[3]

    while (true) {
      optionList.shuffle(); //[3,4,..., 9]
      int answer = optionList[0]; // 3
      List<dynamic> answerList = data[answer]['answers']; //[{...},{...},{...}]
      totalOptions = answerList.length; // 4 o 5
      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<List<dynamic>> answerOptions = [];
      //[
      //  {
      //    "string": "asdasdasd"
      //  },{
      // },{
      // }
      //]
      List<dynamic> ansTemp = data[answer]['answers'];
      answerOptions.add(ansTemp);

      // for (var ans in optionList.sublist(0, 3)) {
      //   if (posAnswer == 3) break;
      //   answerOptions.add(data[answer]['answers']);
      //   posAnswer += 1;
      // }

      Question question = Question.fromJson(data[answer]);
      question.addOptions(answerOptions);
      quiz.questions.add(question);

      if (quiz.questions.length >= totalQuestions) break;
    }

    setState(() {});
  }

//--------------

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(String selected) {
    quiz.questions[questionIndex].selected = selected;
    // pensanding...
    // if (selected == quiz.questions[questionIndex].answers) {
    //   quiz.questions[questionIndex].correct = true;
    //   quiz.right += 1;
    // }

    progressIndex += 1;
    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }

    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Resultados', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preguntas totales: $totalQuestions',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Correctas: ${quiz.right}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Incorrectas: ${(totalQuestions - quiz.right)}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Porcentaje: ${quiz.percent}%',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => QuizzInfo(
                        quiz: quiz,
                      ))),
            );
          },
          child: Text(
            'Ver Respuestas',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF258AD8),
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Color(0xFF258AD8),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                value: progressIndex / totalQuestions,
                minHeight: 20,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 950),
            child: Container(
              height: 650,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: quiz.questions.isNotEmpty
                  ? Card(
                      color: Color(0xFF33C9F2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Text(
                              quiz.questions[questionIndex].question,
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
                                        color: Colors.white,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    title: Text(
                                        quiz.questions[questionIndex].options[0][index]['content'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                      ),),
                                    onTap: () {
                                      _optionSelected(quiz.questions[questionIndex].options[0][index]['content']);
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
