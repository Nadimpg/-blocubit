import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/todo_cubit.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({super.key});

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocBuilder<TodoCubit, TodoInitial>(builder: (context, state) {
        return Column(
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(onPressed: ()=>BlocProvider.of<TodoCubit>(context).addnewTodo(_controller.text), child: Text("add"))
            ,
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                  itemCount: state.todos.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 1,
                      child: ListTile(
                        title: Text(state.todos[index]),
                        trailing: IconButton(
                            onPressed: () =>
                                BlocProvider.of<TodoCubit>(context).deleteTodo(index),
                            icon: Icon(Icons.remove_circle)),
                       
                      ),
                    );
                  }),
            ),
          ],
        );
      })),
    );
  }
}
