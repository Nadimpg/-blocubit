import 'dart:async';

import 'package:bloccubit/view/cubit/counter_cubit_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class CounterCubit extends Cubit<CounterCubitState>{

  int Counter=0;

  CounterCubit() : super(CounterInitiate());
  @override


  void CounterIncrease(){
    Counter++;
    emit(CounterValueupdated(count: Counter));
  }
  void CounterDecrease(){
    Counter--;
    emit(CounterValueupdated(count: Counter));
  }
}