part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

// ignore: must_be_immutable
class UpdateToDo extends TodoEvent {
  String title;
  UpdateToDo(this.title);
}
