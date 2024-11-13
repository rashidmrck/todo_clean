

import 'package:todo_clean/domain/entities/todo.dart';

class ToDoModel extends ToDo {
  ToDoModel({
    required super.id,
    required super.title,
    super.isDone = false,
  });

  // Convert Firestore document to ToDoModel
  factory ToDoModel.fromFirestore(Map<String, dynamic> map, String id) {
    return ToDoModel(
      id: id,
      title: map['title'],
      isDone: map['isDone'],
    );
  }

  // Create a factory constructor to map from ToDo entity to ToDoModel
  factory ToDoModel.fromEntity(ToDo todo) {
    return ToDoModel(
      id: todo.id,
      title: todo.title,
      isDone: todo.isDone,
    );
  }

  // Convert ToDoModel to a map (useful for saving in local data source)
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }

  // Create a ToDoModel from a map (useful for reading from local data source)
  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
    );
  }
}
