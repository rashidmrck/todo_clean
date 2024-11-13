
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_clean/presentation/viewmodels/todo_viewmodel.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('To-Do List')),
          body: ListView.builder(
            itemCount: viewModel.todos.length,
            itemBuilder: (context, index) {
              final todo = viewModel.todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Checkbox(
                  value: todo.isDone,
                  onChanged: (bool? value) {
                    viewModel.updateTodo(
                      todo.copyWith(isDone: value!),
                    );
                  },
                ),
                onLongPress: () {
                  viewModel.deleteTodo(todo.id);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Add To-Do'),
                    content: TextField(
                      onSubmitted: (value) {
                        viewModel.addTodo(value);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
