

import '../repositories/todo_repository.dart';
import '../entities/todo.dart';

class AddToDo {
  final ToDoRepository repository;

  AddToDo(this.repository);

  Future<void> call(ToDo todo) async {
    return await repository.addToDo(todo);
  }
}
