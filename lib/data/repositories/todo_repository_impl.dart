
import 'package:todo_clean/data/datasources/todo_local_data_source.dart';
import 'package:todo_clean/data/models/todo_model.dart';
import 'package:todo_clean/domain/entities/todo.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final ToDoLocalDataSource dataSource;

  ToDoRepositoryImpl(this.dataSource);

  @override
  Future<List<ToDo>> getAllToDos() async {
    final todoModels = await dataSource.getAllToDos();
    return todoModels;
  }

  @override
  Future<void> addToDo(ToDo toDo) async {
    await dataSource.addToDo(ToDoModel.fromEntity(toDo));
  }

  @override
  Future<void> updateToDo(ToDo toDo) async {
    await dataSource.updateToDo(ToDoModel.fromEntity(toDo));
  }

  @override
  Future<void> deleteToDo(String id) async {
    await dataSource.deleteToDo(id);
  }
}
