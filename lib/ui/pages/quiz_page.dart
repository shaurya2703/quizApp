import 'package:flutter/material.dart';
import 'package:quizApp/models/categories.dart';

class QuizPage extends StatefulWidget {
  final Category category;
  final int noOfQuestions;
  final String difficulty;

  QuizPage({
    Key key,
    this.noOfQuestions,
    this.difficulty,
    this.category,
  }) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        elevation: 0.0,
        title: Text('Quiz Page'),
      ),
      body: Container(
        child: Center(
          child: Text('Sample Text Goes Here'),
        ),
      ),
    );
  }
}
