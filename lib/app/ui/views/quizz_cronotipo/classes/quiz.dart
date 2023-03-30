import 'package:pilar_app/app/ui/views/quizz_cronotipo/classes/question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int score = 0;

  Quiz({required this.name, required this.questions});

  // double get percent => (score / questions.length) * 100;
}