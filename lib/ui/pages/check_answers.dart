import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizApp/models/question.dart';

class CheckAnswerPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  CheckAnswerPage({@required this.questions, @required this.answers});

  @override
  Widget build(BuildContext context) {
    print(questions);
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Answers"),
        backgroundColor: Colors.red[500],
        elevation: 0.0,
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
          ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              var unescape = new HtmlUnescape();
              var text = unescape.convert(questions[index].question);
              var correct_answer =
                  unescape.convert(questions[index].correctAnswer);
              return Card(
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 7.0),
                          child: Text(
                            text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        subtitle: answers[index] != correct_answer
                            ? Column(
                                children: <Widget>[
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        Text("Correct Answer : ",
                                            style: TextStyle(fontSize: 17)),
                                        Text(
                                          correct_answer,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "Your Answer : ",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          answers[index],
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Your Answer : ",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        answers[index],
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 17),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      )
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }
}
