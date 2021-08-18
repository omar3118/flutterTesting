import 'package:app01/models/quiz/quiz_model.dart';
import 'package:flutter/material.dart';
import 'quiz_app.dart';
class Questions extends StatelessWidget {

  final String question;

  Questions(this.question);

  @override
  Widget build(BuildContext context) {
    return  Text(
        question,
        style: TextStyle(
          fontSize: 25,
          color: b,
      ),
      );
  }

}
