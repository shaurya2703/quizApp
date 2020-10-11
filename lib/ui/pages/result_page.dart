import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quizApp/models/question.dart';
import 'package:quizApp/ui/pages/check_answers.dart';

class ResultPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  ResultPage({this.answers, this.questions});

  int _correctAnswers = 0;
  int _incorrectAnswers;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < questions.length; i++) {
      if (answers[i] == questions[i].correctAnswer) {
        _correctAnswers++;
      }
    }
    _incorrectAnswers = questions.length - _correctAnswers;

    double _score = (_correctAnswers / questions.length) * 100;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[500],
        elevation: 0.0,
        title: Text('Your Results'),
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(color: Colors.red[500]),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 75),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Total Questions",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              )),
                          Text(
                            questions.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.lightGreen),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Your Score",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              )),
                          Text(
                            "${_score.toString()}%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.lightGreen),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Correct Answers",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              )),
                          Text(
                            "$_correctAnswers/${questions.length}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.lightGreen),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Incorrect Answers",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              )),
                          Text(
                            "$_incorrectAnswers/${questions.length}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.lightGreen),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red[700],
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.red[700],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckAnswerPage(
                                  questions: questions, answers: answers),
                            ));
                      },
                      child: Text(
                        "Check Answers",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
