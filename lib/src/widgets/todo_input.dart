import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class TodoInput extends HookConsumerWidget {
  const TodoInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('### TodoInput build');
    final editFocusNode = useFocusNode();
    final editController = useTextEditingController();

    void add() {
      final value = editController.text.trim();
      if (value.isNotEmpty) {
        ref.read(todoListProvider.notifier).add(value);
        editController.clear();
      }
      editFocusNode.requestFocus();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            //key: addTodoKey,
            focusNode: editFocusNode,
            controller: editController,
            decoration: const InputDecoration(
              labelText: 'What needs to be done?',
            ),
            onSubmitted: (_) => add(),
          ),
        ),
        FloatingActionButton(
          onPressed: () => add(),
          tooltip: 'Add todo',
          mini: true,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
