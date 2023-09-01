import 'package:bloccubit/view/another_screen.dart';
import 'package:bloccubit/view/cubit/counter_cubit.dart';
import 'package:bloccubit/view/cubit/counter_cubit_state.dart';
import 'package:bloccubit/view/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<InternetCubit,InternetState>(

              builder: (context,state){
                if(state is InternetConnected && state.connectionType== ConnectionType.wifi){
                  return Text('wifi');
                }
                if(state is InternetConnected && state.connectionType== ConnectionType.mobile){
                  return Text('Mobile');
                }
                if(state is InternetDisconnected){
                  return Text('InternetDisconnected');
                }
                return CircularProgressIndicator();
              }),
          BlocBuilder<CounterCubit,CounterCubitState>(


            builder: (context,state){
             return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    (state is CounterValueupdated)?Text(state.count.toString()):Text('0'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatingActionButton(
                          heroTag: 'hero 1',
                          onPressed: (){
                          context.read<CounterCubit>().CounterIncrease();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Counter update'),
                              ));
                        },child: Icon(Icons.add),),
                        FloatingActionButton(
                          heroTag: 'hero 2',
                          onPressed: (){
                          context.read<CounterCubit>().CounterDecrease();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Counter remove'),
                              ));
                        },child: Icon(Icons.remove),)
                      ],
                    ),
                    ElevatedButton(
                      child: Text('Go to Another Screen'),
                      onPressed: () {
                      Navigator.of(context).pushNamed('/another');
                      },
                    ),
                  ],
                ),
              );
            },

          ),
        ],
      ),
    );
  }
}
