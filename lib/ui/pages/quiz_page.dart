import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
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
