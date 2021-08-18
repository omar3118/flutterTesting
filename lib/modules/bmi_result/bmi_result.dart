import 'dart:math';

import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final bool isMale;
  final double age;
  final double height;
  final double weight;
  Color w=Colors.white;

  BMIResult(
      {@required this.isMale,
      @required this.weight,
      @required this.age,
      @required this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('BMI Result'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(
                context
            );
          },
          icon:Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gender:',
              style: TextStyle(
                  fontSize: 30,
                  color: w,
              ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                isMale ? 'Male' : 'Female',
                style: TextStyle(
                    fontSize: 30,
                     color: w,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Result:',
                style: TextStyle(
                    fontSize: 30,
                    color: w,
                ),),
              SizedBox(
                width: 10,
              ),
              Text(
                '${(weight/pow(height / 100, 2)).round()}',
                style: TextStyle(
                    fontSize: 30,
                    color:w,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Age:',
                style: TextStyle(
                    fontSize: 30,
                    color: w,
                ),),
              SizedBox(
                width: 10,
              ),
              Text(
                '${age.round()}',
                style: TextStyle(
                    fontSize: 30,
                    color: w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
