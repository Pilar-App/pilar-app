class Question {
  late String question;
  // int score = 0;
  // late int points;
  late List<dynamic> answers;
  List<List<dynamic>> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        answers = json['answers'];

  void addOptions(List<List<dynamic>> newOptions) {
    // score += points;
    options.add(answers);
    options.addAll(newOptions);
    options.shuffle();
  }
}
