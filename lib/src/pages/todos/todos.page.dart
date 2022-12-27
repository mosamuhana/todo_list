import 'dart:developer';

import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('### TodosPage build');
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: const [
            TodosTitle(),
            TodoInput(),
            SizedBox(height: 32),
            TodosFilters(),
            Expanded(child: TodosItemList()),
          ],
        ),
      ),
    );
  }
}
