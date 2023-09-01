import 'package:equatable/equatable.dart';

abstract class CounterCubitState extends Equatable{
  const CounterCubitState();
}

class CounterInitiate extends CounterCubitState{
  @override
  List<Object?> get props => [];
}
class CounterValueupdated extends CounterCubitState{
  int count;
     CounterValueupdated({required this.count});

  @override
  List<Object?> get props => [count];
}