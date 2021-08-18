import 'package:flutter/material.dart';

//First Screen(Home)
class Home extends StatelessWidget {
  //Call constructor
  //Call build method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        shadowColor: Colors.pink,
        leading: Icon(
          Icons.menu,
          color: Colors.tealAccent,
        ),
        centerTitle: true,
        title: Text(
          "Welcome To My World",
          style: TextStyle(
            color: Colors.teal[100],
            fontSize: 17,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('Pressed');
            },
            color: Colors.tealAccent,
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo_outlined,
            ),
            onPressed: () {
              print('Photo');
            },
            color: Colors.tealAccent,
          ),
        ],
      ),
      //
      body: Container(
        margin: EdgeInsetsDirectional.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              4
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer, // For children
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: NetworkImage('https://setav.org/en/assets/uploads/2017/12/395862915996-1132x670.jpg'),
              fit: BoxFit.cover ,
            ),
            Container(
              width:double.infinity,
              color: Colors.black87,
              child:Text(
                 "Al-Quads",
                 textAlign: TextAlign.center ,
                 style: TextStyle(
                   color: Colors.white,


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  /*Column
  *  Column(// Layout invisible widget
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,// Vertical
          crossAxisAlignment: CrossAxisAlignment. center,// Horizontal


          children: <Widget>[
            Container(
              height: 80,
              color: Colors.cyan,
              child: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.yellow,
                size: 55.5,
              ),
            ),
            Container(
              height: 80,
              color: Colors.black,
              child: Icon(
                Icons.access_alarm,
                color: Colors.indigo,

                size: 55.5,
              ),
            ),
            Container(
              height: 80 ,
              color: Colors.amberAccent,
              child: Text(
                "Hello",
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.redAccent,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),*/
  /*Row
  * Row(// Layout invisible widget
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
               child: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.amber,
                 size: 55,

                ),
              ),
            ),
            Expanded(
              child: Container(
                color:Colors.cyan[200],
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.cyan,
                  size: 55,
                ),
              ),),
            Expanded(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.indigo,


                    ),
                  ),
                ),),
          ],
        ),*/
}
