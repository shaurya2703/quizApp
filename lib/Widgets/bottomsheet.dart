import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quizApp/models/categories.dart';
import 'package:quizApp/models/question.dart';
import 'package:quizApp/resources/api.dart';
import 'package:quizApp/ui/pages/check_answers.dart';
import 'package:quizApp/ui/pages/quiz_page.dart';

class MyBottomSheet extends StatefulWidget {
  final Category category;

  MyBottomSheet({@required this.category});

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _noOfQuestions;
  String _difficulty;
  bool processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 0;
    _difficulty = "";
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20.0),
              color: Colors.grey.shade300,
              child: Text(
                widget.category.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 15.0,
          ),
          Text('Select Total Number of Questions',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 12.0, // gap between adjacent chips
            runSpacing: 12.0, // gap between lines
            children: <Widget>[
              ChoiceChip(
                selected: false,
                label: Text('10'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _noOfQuestions == 10
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _noOfQuestions = 10;
                  });
                },
              ),
              SizedBox(
                width: 0.0,
              ),
              ChoiceChip(
                selected: false,
                label: Text('20'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _noOfQuestions == 20
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _noOfQuestions = 20;
                  });
                },
              ),
              SizedBox(
                width: 0.0,
              ),
              ChoiceChip(
                selected: false,
                label: Text('30'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _noOfQuestions == 30
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _noOfQuestions = 30;
                  });
                },
              ),
              SizedBox(
                width: 0.0,
              ),
              ChoiceChip(
                selected: false,
                label: Text('40'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _noOfQuestions == 40
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _noOfQuestions = 40;
                  });
                },
              ),
              SizedBox(
                width: 0.0,
              ),
              ChoiceChip(
                selected: false,
                label: Text('50'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _noOfQuestions == 50
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _noOfQuestions = 50;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text('Select Difficulty',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 12.0, // gap between adjacent chips
            runSpacing: 12.0, // gap between lines
            children: [
              ChoiceChip(
                selected: false,
                label: Text('Any'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _difficulty == null
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _difficulty = null;
                  });
                },
              ),
              ChoiceChip(
                selected: false,
                label: Text('Easy'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _difficulty == "easy"
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _difficulty = "easy";
                  });
                },
              ),
              ChoiceChip(
                selected: false,
                label: Text('Medium'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _difficulty == "medium"
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _difficulty = "medium";
                  });
                },
              ),
              ChoiceChip(
                selected: false,
                label: Text('Hard'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: _difficulty == "hard"
                    ? Colors.red.shade500
                    : Colors.grey.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _difficulty = "hard";
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          processing
              ? CircularProgressIndicator()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red.shade500,
                    onPressed: _startQuiz,
                    child: Text("Start Quiz"),
                  ),
                ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });
    List<Question> questions =
        await getQuestions(widget.category, _noOfQuestions, _difficulty);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              QuizPage(category: widget.category, questions: questions),
          // print(questions);
          // CheckAnswerPage(questions: questions)));
        ));
    setState(() {
      processing = false;
    });
  }
}
