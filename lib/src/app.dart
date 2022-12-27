import 'package:flutter/material.dart';

import 'pages/todos/todos.page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodosPage(),
    );
  }
}
