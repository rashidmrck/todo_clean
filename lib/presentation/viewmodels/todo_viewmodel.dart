
import 'package:flutter/material.dart';
import 'package:todo_clean/data/datasources/remote/auth_service.dart';
import 'package:todo_clean/data/repositories/auth_repository_impl.dart';
import 'package:todo_clean/domain/entities/todo.dart';
import 'package:todo_clean/domain/usecases/add_todo.dart';
import 'package:todo_clean/domain/usecases/delete_todo.dart';
import 'package:todo_clean/domain/usecases/get_all_todos.dart';
import 'package:todo_clean/domain/usecases/update_todo.dart';

class TodoViewModel extends ChangeNotifier {
  final GetAllToDos getAllToDos;
  final AddToDo addToDo;
  final UpdateToDo updateToDo;
  final DeleteToDo deleteToDo;

  TodoViewModel({
    required this.getAllToDos,
    required this.addToDo,
    required this.updateToDo,
    required this.deleteToDo,
  }) {
    AuthRepositoryImpl(AuthService()).signInAnonymously();
  }

  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  Future<void> fetchTodos() async {
    _todos = await getAllToDos();
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    final newToDo = ToDo(
      id: '', // Firestore will generate this
      title: title,
      isDone: false,
    );
    await addToDo(newToDo);
    fetchTodos();
  }

  Future<void> updateTodo(ToDo todo) async {
    await updateToDo(todo);
    fetchTodos();
  }

  Future<void> deleteTodo(String id) async {
    await deleteToDo(id);
    fetchTodos();
  }
}
