
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';


class Todo{

   static List<String> data=[
      'My Name is nadim',
      'Our company name is bd calling it',
      'My Name is nadim',
      'Our company name is bd calling it',
    ];
}

class TodoCubit extends Cubit<TodoInitial>{
  TodoCubit(): super(TodoInitial(todos: Todo.data));

  addnewTodo(String todo){
    final todoList=state.todos;
    todoList.add(todo);
    emit(TodoInitial(todos: todoList));
  }
  deleteTodo(index){
    final todoList=state.todos;
    todoList.removeAt(index);
    emit(TodoInitial(todos: todoList));
  }

}