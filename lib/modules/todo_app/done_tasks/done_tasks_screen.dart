import 'package:app01/shared/components/components.dart';
import 'package:app01/layout/todo_app/cubit/todo_app_cubit.dart';
import 'package:app01/layout/todo_app/cubit/todo_app_states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state){

        List doneTasks= ToDoAppCubit.get(context).tasks[1];

        return ConditionalBuilder(
          condition: doneTasks.length > 0,
          builder: (context) =>
              ListView.separated(
                itemBuilder: (ctx, index) =>
                    buildTaskItems(doneTasks[index], context,isChecked: true),
                separatorBuilder: (ctx, index) =>
                    Divider(indent: 20, color: Colors.grey),
                itemCount: doneTasks.length,
              ),
          fallback: (context) =>
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu,
                            size: 90,
                            color: Colors.grey,
                          ),
                          Text(
                            'No tasks here, please add some tasks 😊',
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 19),
                          )
                        ],
                      ),
                    )),
              ),
        );
      },
    );
  }
}
