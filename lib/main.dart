import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_clean/data/datasources/remote/auth_service.dart';
import 'package:todo_clean/data/datasources/todo_local_data_source.dart';
import 'package:todo_clean/data/repositories/todo_repository_impl.dart';
import 'package:todo_clean/domain/usecases/add_todo.dart';
import 'package:todo_clean/domain/usecases/delete_todo.dart';
import 'package:todo_clean/domain/usecases/get_all_todos.dart';
import 'package:todo_clean/domain/usecases/update_todo.dart';
import 'package:todo_clean/firebase_options.dart';
import 'package:todo_clean/presentation/screens/todo_screen.dart';
import 'package:todo_clean/presentation/viewmodels/todo_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<ToDoLocalDataSource>(create: (_) => ToDoLocalDataSource()),
        Provider<ToDoRepositoryImpl>(
          create: (context) => ToDoRepositoryImpl(
            context.read<ToDoLocalDataSource>(),
          ),
        ),
        ChangeNotifierProvider<TodoViewModel>(
          create: (context) => TodoViewModel(
            getAllToDos: GetAllToDos(context.read<ToDoRepositoryImpl>()),
            addToDo: AddToDo(context.read<ToDoRepositoryImpl>()),
            updateToDo: UpdateToDo(context.read<ToDoRepositoryImpl>()),
            deleteToDo: DeleteToDo(context.read<ToDoRepositoryImpl>()),
          ),
        ),
      ],
      child: const MaterialApp(
        home: TodoScreen(),
      ),
    );
  }
}
