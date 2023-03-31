class Question {
  
  late String question;
  late List<dynamic> answers;
  late Map<String, dynamic> selected;

  List<List<dynamic>> options = [];
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
