import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<UpdateToDo>((event, emit) {
      if (event.title.isEmpty) {
        addError('Title cannot be empty!');
        return;
      }
      final todo = Todo(
        name: event.title,
        createdAt: DateTime.now(),
      );
    });
  }
}
