import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_todos_page.dart';

final _myTodosTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    centerTitle: false,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.orange,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  primarySwatch: Colors.orange,
  primaryIconTheme: const IconThemeData(color: Colors.white),
);

class MyTodosApp extends StatelessWidget {
  const MyTodosApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.orange,
      ),
    );
    return MaterialApp(
      title: 'My Todos Solution',
      theme: _myTodosTheme,
      home: const MyTodosPage(),
    );
  }
}
