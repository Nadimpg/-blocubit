import 'package:bloccubit/view/another_screen.dart';
import 'package:bloccubit/view/cubit/counter_cubit.dart';
import 'package:bloccubit/view/cubit/counter_cubit_state.dart';
import 'package:bloccubit/view/cubit/internet_cubit.dart';
import 'package:bloccubit/view/cubit/todo_cubit.dart';
import 'package:bloccubit/view/home_screen.dart';
import 'package:bloccubit/view/second_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
     BlocProvider(create: (context)=>CounterCubit(),

     child: MyApp(

     ),
     )
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final CounterCubit _counterCubit=CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>CounterCubit(),),
          BlocProvider<InternetCubit>(create: (context)=>InternetCubit(connectivity: Connectivity())),
          BlocProvider(create: (_)=>TodoCubit())
        ],
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     routes: {
        '/':(_)=>BlocProvider.value(
          value: _counterCubit,
          child: HomeScreen(),
        ),
       '/another':(_)=>BlocProvider.value(
         value: _counterCubit,
         child: AnotherScreen(),
       ),
        '/second':(_)=>BlocProvider.value(
         value: _counterCubit,
         child: SecondScreen(),
       ),

     },
    ));
  }
}

