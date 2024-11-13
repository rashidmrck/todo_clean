

import '../repositories/todo_repository.dart';
import '../entities/todo.dart';

class UpdateToDo {
  final ToDoRepository repository;

  UpdateToDo(this.repository);

  Future<void> call(ToDo todo) async {
    return await repository.updateToDo(todo);
  }
}
