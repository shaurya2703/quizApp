import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quizApp/Widgets/bottomsheet.dart';
import 'package:quizApp/models/categories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red[500],
          elevation: 0.0,
          title: Text('Quiz App'),
        ),
        body: Stack(children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(color: Colors.red[500]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 1000
                        ? 7
                        : MediaQuery.of(context).size.width > 600 ? 4 : 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: categories.length,
                itemBuilder: (context, index) =>
                    _buildCategoryItem(context, index)),
          )
        ]));
  }
}

Widget _buildCategoryItem(BuildContext context, int index) {
  Category category = categories[index];
  return MaterialButton(
    onPressed: () => _categoryPressed(context, category),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    color: Colors.grey.shade800,
    textColor: Colors.white70,
    splashColor: Colors.blue[700],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(category.icon),
        SizedBox(height: 10.0),
        Text(
          category.name,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

void _categoryPressed(BuildContext context, Category category) {
  showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
            builder: (context) => MyBottomSheet(category: category),
            onClosing: () {},
          ));
}
