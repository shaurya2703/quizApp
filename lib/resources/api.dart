import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizApp/models/categories.dart';
import 'package:quizApp/models/question.dart';

const String baseUrl = 'https://opentdb.com/api.php';

Future<List<Question>> getQuestions(
    Category category, int total, String difficulty) async {
  String url = '$baseUrl?amount=$total&category=${category.id}';

  if (difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }
  print(url);
  http.Response response = await http.get(url);
  List<Map<String, dynamic>> data =
      List<Map<String, dynamic>>.from(json.decode(response.body)["results"]);

  List<Question> questions = List<Question>();

  data.forEach((element) {
    String _categoryName = element["category"];
    Type _type = element["type"] == "multiple" ? Type.multiple : Type.boolean;
    Difficulty _difficulty = element["difficulty"] == "easy"
        ? Difficulty.easy
        : element["difficulty"] == "medium"
            ? Difficulty.medium
            : Difficulty.hard;
    String _question = element["question"];
    String _correctAnswer = element["correct_answer"];
    List<dynamic> _incorrectAnswers = element["incorrect_answers"];

    Question question = Question(
      categoryName: _categoryName,
      type: _type,
      difficulty: _difficulty,
      question: _question,
      correctAnswer: _correctAnswer,
      incorrectAnswers: _incorrectAnswers,
    );
    if (question != null) {
      questions.add(question);
    }
  });
  // print(questions[0].categoryName);
  return questions;
}
