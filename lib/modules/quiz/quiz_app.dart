import 'package:app01/models/quiz/quiz_model.dart';
import 'package:app01/modules/quiz/answer.dart';
import 'package:app01/modules/quiz/question.dart';
import 'package:app01/modules/quiz/result.dart';
import 'package:flutter/material.dart';

Color w = Colors.white;

Color b = Color(0xFF1A1C21);

Color t = Colors.teal;

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool isSwitch = false;

  int totalScore = 0;

  int counter = 0;

  List decrement = [];

  void setCounter([int score]) {
    score != null ? totalScore += score : totalScore = 0;
    score != null ? decrement.add(score) : decrement.clear();
    setState(() {
      counter < listQ.length ? counter++ : counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w,
      appBar: AppBar(
        backgroundColor: t,
        title: Text(
          "Quiz-101",
          style: TextStyle(
            fontSize: 30,

          ),
        ),
        leading: Icon(
          Icons.menu,
          size: 28,
        ),
        actions: <Widget>[
          Switch(
            value: isSwitch,
            onChanged: (value) {
              setState(() => isSwitch = value);
              if (value) {
                w = Color(0xFF1A1C21);
                b = Colors.white;
                t=Color(0xFF292A2D);
              } else {
                w = Colors.white;
                b = Color(0xB31A1C21);
                t=Colors.teal;
              }
            },
            activeColor: b,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: counter < listQ.length
            ? Column(
                children: [
                  Questions(listQ[counter].question),
                  SizedBox(
                    height: 20,
                  ),
                  Answers(listQ[counter].answer, setCounter),
                ],
              )
            : Result(setCounter, totalScore, listQ.length),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: w,
        ),
        backgroundColor: Colors.teal,
        onPressed: () => setState(() {
          if (counter != 0) {
            --counter;
            totalScore -= decrement[counter];
            decrement.removeAt(counter);
          }
        }),
      ),
    );
  }
}

final List<QuizModel> listQ = [
  QuizModel(
      question:
          "1. A linear list of elements in which deletion can be done from one end (front) and insertion can take place only at the other end (rear) is known as :",
      answer: {
        0: {'text': 'Queue', 'score': 1},
        1: {'text': 'Stack', 'score': 0},
        2: {'text': 'Linked list', 'score': 0},
      }),
  QuizModel(question: " A queue follows :", answer: {
    0: {'text': 'LIFO (Last In First Out) principle', 'score': 0},
    1: {'text': 'FIFO (First In First Out) principle', 'score': 1},
    2: {'text': 'Ordered array', 'score': 0},
  }),
  QuizModel(question: "Circular Queue is also known as :", answer: {
    0: {'text': ' Rectangle Buffer', 'score': 0},
    1: {'text': 'Square Buffer', 'score': 0},
    2: {'text': 'Curve Buffer', 'score': 0},
    3: {'text': 'Ring Buffer', 'score': 1},
  }),
];
