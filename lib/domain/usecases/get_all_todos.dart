
import 'package:todo_clean/domain/entities/todo.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class GetAllToDos {
  final ToDoRepository repository;

  GetAllToDos(this.repository);

  Future<List<ToDo>> call() async {
    return await repository.getAllToDos();
  }
}
