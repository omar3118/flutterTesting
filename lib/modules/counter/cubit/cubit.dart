import 'package:app01/modules/counter/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> { // <int> the states you will use
  CounterCubit() : super(0);

  static  CounterCubit get(context) => BlocProvider.of(context);  // To return The same Object<BLoC> for all items passed the same context
/*
The BLoCProvider associated with specific Object
 */
  void increment() => emit(state + 1); // emit => To notify the listener hey the state is changed and give it the new state

  void decrement() => emit(state - 1);
}
