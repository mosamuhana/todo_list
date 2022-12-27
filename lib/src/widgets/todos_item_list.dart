import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import 'todo_item.dart';

class TodosItemList extends ConsumerWidget {
  const TodosItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('### TodosItemList build');
    final todos = ref.watch(filteredTodos);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ProviderScope(
          overrides: [currentTodo.overrideWithValue(todos[index])],
          child: const TodoItem(),
        );
      },
    );
  }
}
