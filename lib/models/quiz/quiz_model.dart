import 'package:flutter/material.dart';

class QuizModel {
  final String question;
  final Map<int,Map> answer;

  QuizModel({
    @required this.question,
    @required this.answer,
  });

}
