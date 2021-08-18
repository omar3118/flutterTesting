/*
import 'package:flutter/material.dart';

void main() {
  runApp(Fapp());
}

class Fapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Abstract function from abstract class so we must override it
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is a title Hello World"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(children: <Widget>[
          Text("The Body of the program"),
          Text("The 2 body of the program"),
          Text("The 3 body fo the program"),
        ])),
        floatingActionButton: FloatingActionButton(
          child: Text("Click"),
        ),
      ),
    );
  }
}
*/
/*
import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {

  //1-)Call Constructor
  //2-)Call StateMethod

  @override
  State<StatefulWidget> createState() {
    return myapps();
  }
}

class myapps extends State<myapp> {
  var counter = 0;

  void incre() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),

          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
            alignment: Alignment.center,
            color: Colors.teal[200],
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hello World',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 13,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text("Counter:$counter",
                      style: TextStyle(
                        color: Colors.pink[700],
                      )),
                ])),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan[800],
            foregroundColor: Colors.red[300],
            onPressed: incre,
            child: Text("inc")),
      ),
    );
  }
}

 */

import 'package:app01/layout/news_app/cubit/news_app_cubit.dart';
import 'package:app01/layout/news_app/cubit/news_app_states.dart';
import 'package:app01/layout/news_app/news_layout.dart';
import 'package:app01/layout/todo_app/todo_layout.dart';
import 'package:app01/modules/bmi/bmi_calculator.dart';
import 'package:app01/modules/counter/counter.dart';
import 'package:app01/modules/home/home.dart';
import 'package:app01/modules/login/log_in.dart';
import 'package:app01/modules/messenger/messenger.dart';
import 'package:app01/modules/quiz/quiz_app.dart';
import 'package:app01/shared/bloc_observer.dart';
import 'package:app01/shared/network/local/cache_helper.dart';
import 'package:app01/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/users/user_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();
  runApp(MyApp());
} //Entry point


class MyApp extends StatelessWidget {
  //MyApp is Myapp and StatelessWidget and Widget (Polymorphism) extends
  //Call Constructor
  //Call build

  /*
  NOTE: But in state widget the first thing calling after the constructor is initState method
   */

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>NewsAppCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        buildWhen: (priv,curr){
          if (curr is NewsGetSearchLoading || curr is NewsGetSearchSuccess)
            return false;
          else
            return true;
        },
        listener: (context,state){
          print('inMainLis');
        },
        builder:(context,state){
          print('inMain');
          return MaterialApp /*The design of my app*/ (
          theme: ThemeData( // For light theme


            accentColor: Colors.black,

            primaryColor: Colors.deepOrange,

            primarySwatch: Colors.deepOrange,

            scaffoldBackgroundColor: Colors.white,

            appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              elevation: 0,
              color: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              iconTheme: IconThemeData(
                color: Colors.deepOrange,
              )
            ),

            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.shifting,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              selectedItemColor: Colors.orange,
            ),

            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Color(-14605017),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )
            ),

          ),

          darkTheme: ThemeData( // For dark theme

            accentColor: Colors.white,

            primaryColor: Colors.teal,

            primarySwatch:Colors.teal,

            scaffoldBackgroundColor:Color(-14605017),

            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light
              ),
                backwardsCompatibility: false,
                elevation: 0,
                color: Color(-14605017),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                iconTheme: IconThemeData(
                  color: Colors.teal[300],
                )
            ),

            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color(-14605017),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              selectedItemColor: Colors.teal[300],
            ),

            textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )
            ),
          ),

          themeMode: NewsAppCubit.get(context).isDark? ThemeMode.dark: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Directionality(
            textDirection: TextDirection.rtl,
              child:NewsLayout(), ),
        );
        },
      ),
    );
  }
}
