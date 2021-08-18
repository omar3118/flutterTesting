/*
All the logic is here
 */

import 'package:app01/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:app01/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:app01/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:app01/layout/todo_app/cubit/todo_app_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class ToDoAppCubit extends Cubit<AppStates> {
  ToDoAppCubit() : super(AppInitialState());

  static ToDoAppCubit get(context) => BlocProvider.of(context);

  Database database;

  int selectedIndex = 0;

  List tasks = [
    <Map<String, Object>>[], // New For ToDoApp
    <Map<String, Object>>[], // Done For ToDoApp
    <Map<String, Object>>[], // Archived For ToDoApp
  ];

  List<Color> color = [

    Colors.cyan[700],
    Colors.teal,
    Colors.blue[700],
  ];

  List classObject = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List title = [
    'NewTasks',
    'DoneTasks',
    'ArchivedTasks',
  ];



  void onChangeBottomSheet() {
    emit(ChangeFloatingIcon());
  }

  Widget bottomNavigationBar()=> BottomNavigationBar(
  onTap: (index){
    selectedIndex=index;
    emit(ChangeBottomNavIndex());
  },
  currentIndex: selectedIndex,
  fixedColor: Colors.blue,
  showUnselectedLabels: true,
  unselectedItemColor: Colors.grey,
  iconSize: 25,
  type: BottomNavigationBarType.shifting,
  items: <BottomNavigationBarItem>[
  BottomNavigationBarItem(
  icon: Icon(
  Icons.add_task_rounded,
  ),
  label: "Tasks",
  ),
  BottomNavigationBarItem(
  icon: Icon(
  Icons.check_circle_outline,
  ),
  label: 'Done',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.archive_outlined),
  label: 'Archived',
  ),
  ],
  );


  void createDB() async {
    database = await openDatabase(
      'todo.db',
      version: 1, // If I increment the version then it will call on create

      onCreate: (db, version) async {
        print('DB created');

        try {
          await db.execute(
              'create table tasks(id integer primary key, title text, date text, time text, status text)');

          print('Table created');
        } catch (err) {
          print('The Error $err.toString()');
        }
      },

      onOpen: (db) => print('DB opened'),
    );
    readFromDB();
  }

  Future insertToDB(
      {@required String title, @required String time, @required String date}) {
    return database.transaction((txn) {
      txn
          .rawInsert(
              'insert into tasks(title,date,time,status) values("$title","$date","$time","new")')
          .then((id) => print('Successfully insert in $id'))
          .catchError((error) => print('InsertError: ${error.toString()}'));
      return null;
    }).then((value) {
      emit(InsertDB());
      readFromDB();
    });
  }

  void readFromDB() async {
    tasks[0].clear();
    tasks[1].clear();
    tasks[2].clear();
    await database.rawQuery("Select * from tasks").then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          tasks[0].add(element);
        else if (element['status'] == 'done')
          tasks[1].add(element);
        else
          tasks[2].add(element);
      });
      emit(ReadDB());
      print('ReadDB Successfully:${tasks} ');
    }).catchError((error) => print('Error in readFromDB: $error'));
  }

  void updateToDB(oldState,newState, id) {

    if (oldState== 'new')
      tasks[0].removeWhere((item) => item['id'] == id);
    else if (oldState== 'done')
      tasks[1].removeWhere((item) =>
      item['id'] ==
          id); // To compare two map/list => listEqual/mapEqual
    else
      tasks[2].removeWhere((item) => item['id'] == id);

           database
          .rawUpdate('Update tasks set status = "$newState" where id = $id')
          .then((valueUp) {
            database.rawQuery('Select * from tasks where id = $id').then((value) {
              if (newState == 'new')
                tasks[0].add(value[0]);
              else if (newState == 'done')
                tasks[1].add(value[0]);
              else
                tasks[2].add(value[0]);
            });

        emit(UpdateDB());
      });
    }


  void deleteFromDB(itemState,id) {

    tasks[0].removeWhere((item)=>item['id']==id);
    tasks[1].removeWhere((item)=>item['id']==id);
    tasks[2].removeWhere((item)=>item['id']==id);

     database.rawDelete('Delete from tasks where id = $id').then((value) {
      // When you delete the widget you must delete it from widget tree (:
      emit(DeleteDB());
    });
  }
}
