import 'package:flutter/material.dart';
import 'package:my_todos/widgets/my_widgets.dart';
import 'package:my_todos_core/core.dart';

typedef OnTodoItemChanged = void Function(TodoItem oldItem, TodoItem newItem);
typedef OnTodoItemReorder = void Function(int formInxex, int toIndex);

class MyTodoListView extends StatelessWidget {
  const MyTodoListView({
    Key? key,
    this.todoItems = const [],
    required this.onTodoItemChanged,
    required this.onTodoItemReorder,
  }) : super(key: key);
  final List<TodoItem> todoItems;
  final OnTodoItemChanged onTodoItemChanged;
  final OnTodoItemReorder onTodoItemReorder;
  @override
  Widget build(BuildContext context) {
    if (todoItems.isEmpty) {
      return const Center(
        child: Text('Nothing to do 👏'),
      );
    }
    const firstItem = 0;
    final lastItem = todoItems.length - 1;
    return ReorderableListView.builder(
      onReorder: onTodoItemReorder,
      itemCount: todoItems.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final todoItem = todoItems[index];
        final subTitle =
            todoItem.description == null ? null : Text(todoItem.description!);
        return MyTodoItemListTile(
          key: ValueKey(todoItem.id),
          title: Text(todoItem.title),
          subTitle: subTitle,
          isDone: todoItem.isDone,
          hideTopLine: index == firstItem,
          hideBottomLine: index != lastItem,
          onChanged: (isDone) {
            final updatedTodoItem = todoItem.copyWith(isDone: isDone);
            onTodoItemChanged(todoItem, updatedTodoItem);
          },
        );
      },
    );
  }
}
