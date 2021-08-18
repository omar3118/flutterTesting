import 'package:app01/shared/components/components.dart';
import 'package:app01/layout/todo_app/cubit/todo_app_cubit.dart';
import 'package:app01/layout/todo_app/cubit/todo_app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// We are put this bottom in the layout because it's not a just class it's navigate between classes (:

class ToDoLayout extends StatelessWidget {

  int currentIndex;

  ToDoAppCubit iCubit;

  bool isBSheetOpen = false;

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) { // You must return a widget because the app use it not execute directly
    return BlocProvider(
      create: (ctx1) => ToDoAppCubit()
        ..createDB(), // Tow dots (..) meant like put the object in variable
      child: BlocConsumer<ToDoAppCubit, AppStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {

          final ToDoAppCubit cubit = ToDoAppCubit.get(ctx);

          currentIndex = cubit.selectedIndex;

          iCubit = cubit;

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
                backgroundColor: cubit.color[currentIndex],
                titleSpacing: 30,
                centerTitle: true,
                title: Text(
                  "${cubit.title[currentIndex]}",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            body: cubit.classObject[currentIndex],
            floatingActionButton: FloatingActionButton(
              backgroundColor: cubit.color[currentIndex],
              onPressed: () async {
                if (formKey.currentState != null) {
                  if (formKey.currentState.validate()) {
                    await cubit.insertToDB(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                    Navigator.pop(context);
                    timeController.clear();
                    titleController.clear();
                    dateController.clear();
                    isBSheetOpen = false;
                  }
                } else {
                  bottomSheet();
                  isBSheetOpen = true;
                }
                cubit.onChangeBottomSheet();
              },
              child: Icon(isBSheetOpen ? Icons.add : Icons.edit),
            ),
            bottomNavigationBar: cubit.bottomNavigationBar(),
          );
        },
      ),
    );
  }

  void bottomSheet() {
    scaffoldKey.currentState
        .showBottomSheet(
          (ctx) => Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.white,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  defaultTFF(
                    controller: titleController,
                    validator: (String value) =>
                        value.isEmpty ? 'Must be not empty' : null,
                    labelText: 'Title',
                    radius: 30,
                    prefixIcon: Icons.title_rounded,
                    psColor: iCubit.color[currentIndex],
                  ),
                  SizedBox(height: 10),
                  defaultTFF(
                    controller: timeController,
                    validator: (String value) =>
                        value.isEmpty ? 'Must be not empty' : null,
                    labelText: 'Time',
                    radius: 30,
                    prefixIcon: Icons.watch_later_outlined,
                    psColor: iCubit.color[currentIndex],
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      FocusScope.of(ctx).requestFocus(new FocusNode());
                      return timePicker(ctx);
                    },
                  ),
                  SizedBox(height: 10),
                  defaultTFF(
                    controller: dateController,
                    validator: (String value) =>
                        value.isEmpty ? 'Must be not empty' : null,
                    labelText: 'Date',
                    radius: 30,
                    prefixIcon: Icons.date_range,
                    psColor: iCubit.color[currentIndex],
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      FocusScope.of(ctx).requestFocus(new FocusNode());
                      return datePicker(ctx);
                    },
                  ),
                ],
              ),
            ),
          ),
          elevation: 20,
        )
        .closed
        .then((value) {
      isBSheetOpen = false;
      iCubit.onChangeBottomSheet();
    });
  }

  timePicker(ctx) {
    return showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.now(),
    )
        .then((value) => timeController.text =
            value != null ? value.format(ctx) : TimeOfDay.now().format(ctx))
        .catchError((error) => print('Error in timePicker: $error'));
  }

  datePicker(ctx) {
    return showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime.parse('2020-08-09'),
      lastDate: DateTime.parse('2022-08-09'),
    )
        .then((value) => dateController.text =
            DateFormat.yMd().format(value != null ? value : DateTime.now()))
        .catchError((error) => print('Error in datePicker: $error'));
  }
}
