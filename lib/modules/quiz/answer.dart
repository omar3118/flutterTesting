import 'package:app01/shared/components/components.dart';
import 'package:flutter/material.dart';

class Answers extends StatelessWidget {



  final Map answer;

  final Function setCounter;

  Answers(this.answer,this.setCounter) ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
         //physics: NeverScrollableScrollPhysics(),
        //shrinkWrap: true,
        separatorBuilder: (context,index)=>Divider(height: 20,color: Colors.grey,),
        itemBuilder: (context,index)=>answerBuild(answer[index]),
        itemCount: answer.length,
      ),
    );
  }


  Widget answerBuild(Map s){

   return defaultButton(
     onPressed: ()=>setCounter(s['score']),
     text: s['text'],
     height: 40,


   );
  }
}
