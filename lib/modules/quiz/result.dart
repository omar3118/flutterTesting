import 'package:flutter/material.dart';
import 'quiz_app.dart';

class Result extends StatelessWidget {


  final Function setCounter;

  final totalScore;

  final length;

  Result(this.setCounter,this.totalScore,this.length);


  String get mark{
    String tem;
    return tem=totalScore<=1? "Oops":'Good';
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$mark! => $totalScore/$length',
          style: TextStyle(
            fontSize: 30,
            color: Colors.teal,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed:setCounter,
            child:Text(
              '"Restart The Quiz"',
              style: TextStyle(
                fontSize: 25,
              ),
            ) ,
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          """Note:
 All the questions are from SanFoundry web site .""",
          style: TextStyle(
            color: b,
            fontSize: 17,
          ),
          textAlign: TextAlign.center,

        ),
      ],
    );
  }
}
