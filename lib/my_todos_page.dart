import 'package:appbuilders_my_todos/core.dart';
import 'package:flutter/material.dart';
import 'package:my_todos/my_new_todo_page.dart';

import 'widgets/my_widgets.dart';

class MyTodosPage extends StatefulWidget {
  const MyTodosPage({Key? key}) : super(key: key);

  @override
  State<MyTodosPage> createState() => _MyTodosPageState();
}

class _MyTodosPageState extends State<MyTodosPage> {
  final _todoList = TodoList();

  void _incrementTodoItem() {
    setState(() {
      _todoList.save(
        TodoItem(
          title: 'Todo item',
          description: 'My index is ${_todoList.length}',
        ),
      );
    });
  }

  void _changeItem(TodoItem _, TodoItem updateItem) {
    setState(() {
      _todoList.save(updateItem);
    });
  }

  void _move(int fromIndex, int toIndex) {
    if (fromIndex < toIndex) {
      toIndex -= 1;
    }
    setState(() {
      _todoList.move(fromIndex, toIndex);
    });
  }

  void _remove(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  void _showForm() async {
    var route = MaterialPageRoute<TodoItem?>(builder: (context) {
      return const MyNewTodoPage();
    });

    final newTodoItem = await Navigator.of(context).push<TodoItem?>(route);
    if (newTodoItem == null) return;
    setState(() {
      _todoList.save(newTodoItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todos solution'),
        automaticallyImplyLeading: false,
        actions: const [
          MyTodosPopupMenu(),
        ],
      ),
      drawer: const MyDrawer(),
      body: MyTodoListView(
        todoItems: _todoList.toList(),
        onTodoItemReorder: _move,
        onTodoItemRemoved: _remove,
        onTodoItemChanged: _changeItem,
      ),

      bottomNavigationBar: _BottomNavigationBar(
        onBellPressed: _incrementTodoItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showForm,
        tooltip: 'Add a new todo item',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key, required this.onBellPressed})
      : super(key: key);

  final VoidCallback onBellPressed;
  @override
  Widget build(BuildContext context) {
    return MyTodosNavigationBar(
      onMenuPressed: () {
        Scaffold.of(context).openDrawer();
      },
      onBellPressed: onBellPressed,
    );
  }
}
