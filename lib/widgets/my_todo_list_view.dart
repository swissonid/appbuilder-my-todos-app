import 'package:appbuilders_my_todos/core.dart';
import 'package:flutter/material.dart';
import 'package:my_todos/widgets/my_widgets.dart';

typedef OnTodoItemChanged = void Function(TodoItem oldItem, TodoItem newItem);
typedef OnTodoItemReorder = void Function(int formInxex, int toIndex);
typedef OnTodoItemRemoved = void Function(int index);

class MyTodoListView extends StatelessWidget {
  const MyTodoListView({
    Key? key,
    this.todoItems = const [],
    required this.onTodoItemChanged,
    required this.onTodoItemReorder,
    required this.onTodoItemRemoved,
  }) : super(key: key);
  final List<TodoItem> todoItems;
  final OnTodoItemChanged onTodoItemChanged;
  final OnTodoItemReorder onTodoItemReorder;
  final OnTodoItemRemoved onTodoItemRemoved;
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
        return Dismissible(
          background: const _ListTileBackground(),
          onDismissed: (_) {
            onTodoItemRemoved(index);
          },
          key: ValueKey(todoItem.id),
          child: MyTodoItemListTile(
            title: Text(todoItem.title),
            subTitle: subTitle,
            isDone: todoItem.isDone,
            hideTopLine: index == firstItem,
            hideBottomLine: index != lastItem,
            onChanged: (isDone) {
              final updatedTodoItem = todoItem.copyWith(isDone: isDone);
              onTodoItemChanged(todoItem, updatedTodoItem);
            },
          ),
        );
      },
    );
  }
}

class _ListTileBackground extends StatelessWidget {
  const _ListTileBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const icon = Icon(
      Icons.delete,
      color: Colors.white,
    );
    const text = Text(
      'Delete',
      style: TextStyle(color: Colors.white),
    );
    const spacer = SizedBox(
      width: 8,
    );
    return Container(
      color: Colors.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [spacer, icon, text],
          ),
          Row(
            children: const [text, icon, spacer],
          )
        ],
      ),
    );
  }
}
