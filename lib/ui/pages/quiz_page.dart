import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizApp/models/categories.dart';
import 'package:quizApp/models/question.dart';

class QuizPage extends StatefulWidget {
  final Category category;
  final List<Question> questions;

  QuizPage({
    // Key key,
    @required this.questions,
    @required this.category,
  });
  // :super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    // print(widget.questions[0].difficulty);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        elevation: 0.0,
        title: Text(widget.category.name),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            itemCount: widget.questions.length,
            itemBuilder: (context, index) {
              var unescape = new HtmlUnescape();
              var text = unescape.convert(widget.questions[index].question);
              return Text(text);
            },
          ),
        ),
      ),
    );
  }
}
