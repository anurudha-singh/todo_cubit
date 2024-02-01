import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/todo_cubit.dart';
import 'package:todo_cubit/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(
                title: Column(
                  children: [
                    Card(
                        margin: const EdgeInsets.all(5),
                        shadowColor: Colors.black,
                        elevation: 10,
                        child: Container(
                            color: const Color.fromARGB(255, 123, 236, 202),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              todo.name,
                              style: const TextStyle(fontSize: 25),
                            ))),
                    const Divider()
                  ],
                ),
                trailing: Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
