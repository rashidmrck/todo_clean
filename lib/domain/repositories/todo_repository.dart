
import 'package:todo_clean/domain/entities/todo.dart';

abstract class ToDoRepository {
  Future<List<ToDo>> getAllToDos();
  Future<void> addToDo(ToDo toDo);
  Future<void> updateToDo(ToDo toDo);
  Future<void> deleteToDo(String id);
}
