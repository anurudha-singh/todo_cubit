import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty!');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );
    //List<ToDo> todo=[todo_obj1,todo_obj2,todo_obj3,...., new todo_objn,]
    // state.add(todo);
    // this line will cause problem becuase the state will be treated as same it before and it will not emit any new state towards the UI becuase cubit emits any state only when there is change in a state..
    emit([...state, todo]); // state is a list here.
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print('TodoCubit - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('TodoCubit - $error');
  }
}
