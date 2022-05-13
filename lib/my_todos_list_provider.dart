import 'package:flutter/material.dart';
import 'package:my_todos_core/core.dart';

class MyTodoListPorvider extends InheritedWidget {
  const MyTodoListPorvider({
    super.key,
    required super.child,
    required this.todoList,
  });

  final TodoList todoList;

  static MyTodoListPorvider of(BuildContext context) {
    final myTodoListProvider =
        context.dependOnInheritedWidgetOfExactType<MyTodoListPorvider>();
    assert(myTodoListProvider != null,
        'No MyTodoListPorvider found in the context');
    return myTodoListProvider!;
  }

  @override
  bool updateShouldNotify(MyTodoListPorvider oldWidget) {
    return todoList != oldWidget.todoList;
  }
}
