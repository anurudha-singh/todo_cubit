part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

// ignore: must_be_immutable
final class ToDoUpdated extends TodoState {
  List<Todo> todoList = [];
  ToDoUpdated(this.todoList);
  List<Object> get props => [todoList];
}
