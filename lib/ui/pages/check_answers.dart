import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizApp/models/question.dart';

class CheckAnswerPage extends StatelessWidget {
  final List<Question> questions;
  Map<int, dynamic> answers = {
    1: "abc",
    2: "def",
    3: "xyz",
  };

  CheckAnswerPage({@required this.questions});

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
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          text,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Correct Answer : "),
                                Text(correct_answer)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Your Answer : "),
                                Text(correct_answer)
                              ],
                            ),
                          ],
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
