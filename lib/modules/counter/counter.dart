import 'package:app01/modules/counter/cubit/cubit.dart';
import 'package:app01/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // context to notify where is the program run now (where I'm)

    return BlocProvider(
      create: (context)=> CounterCubit(), // Must be Bloc(Cubit) / and must the builder of the BlocConsumer use the same Object

      child: BlocConsumer<CounterCubit,int>(

        listener: (context1,state){print('NewState');},// If emit a newState => rebuild => builder

        builder: (context2,state)=>Scaffold(

          appBar: AppBar(
            title: Text('Counter-BLoC'),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                defaultButton(
                  onPressed: () => CounterCubit.get(context2).decrement() ,
                  text: 'Minus',
                  shape: CircleBorder(),
                  width: 70,
                  height: 70,
                ),
          Text('$state',style: TextStyle(fontSize: 50),),
                defaultButton(
                  onPressed: () => CounterCubit.get(context2).increment(),
                  text: 'Plus',
                  shape: CircleBorder(),
                  width: 70,
                  height: 70,
                ),
              ],
            ),
          ),
        ),

      ),
    );

  }
}
