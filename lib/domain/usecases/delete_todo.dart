

import '../repositories/todo_repository.dart';

class DeleteToDo {
  final ToDoRepository repository;

  DeleteToDo(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteToDo(id);
  }
}
