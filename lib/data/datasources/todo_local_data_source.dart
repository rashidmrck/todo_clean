
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_clean/data/models/todo_model.dart';

class ToDoLocalDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<ToDoModel>> getAllToDos() async {
    final querySnapshot = await firestore.collection('todos').get();
    return querySnapshot.docs.map((doc) {
      return ToDoModel.fromFirestore(doc.data(), doc.id);
    }).toList();
  }

  Future<void> addToDo(ToDoModel toDo) async {
    await firestore.collection('todos').add(toDo.toMap());
  }

  Future<void> updateToDo(ToDoModel toDo) async {
    await firestore.collection('todos').doc(toDo.id).update(toDo.toMap());
  }

  Future<void> deleteToDo(String id) async {
    await firestore.collection('todos').doc(id).delete();
  }
}
