import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizApp/models/categories.dart';
import 'package:quizApp/models/question.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final Category category;

  const QuizPage({@required this.questions, this.category});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];

    final List<dynamic> options = question.incorrectAnswers;

    if (!options.contains(question.correctAnswer)) {
      options.insert(_currentIndex, question.correctAnswer);
      options.shuffle();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        elevation: 0.0,
        title: Text(widget.category.name),
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              decoration: BoxDecoration(color: Colors.red[500]),
              height: MediaQuery.of(context).size.height / 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade200,
                      child: Text("${_currentIndex + 1}"),
                    ),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: Text(
                        HtmlUnescape().convert(question.question),
                        style: MediaQuery.of(context).size.width > 800
                            ? TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              )
                            : TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Card(
                  child: Column(
                    children: <Widget>[
                      ...options.map((option) => RadioListTile(
                            title: Text(HtmlUnescape().convert("$option")),
                            groupValue: _answers[_currentIndex],
                            value: option,
                            onChanged: (value){
                              setState(() {
                                _answers[_currentIndex] = option;
                                print(_currentIndex);
                              });
                            },
                          )),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(right: 25),
                    margin: EdgeInsets.all(40),
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      child: Text(
                        _currentIndex == (widget.questions.length - 1)
                            ? "Submit"
                            : "Next",
                      ),
                      onPressed: _nextSubmit,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return null;
        },
      ));
    }
  }
}
