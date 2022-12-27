import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks.dart';
import '../providers.dart';

class TodoItem extends HookConsumerWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(currentTodo);
    log('### TodoItem build (todo.id: ${todo.id})');
    final focusNode = useFocusNode();
    final isFocused = useIsFocused(focusNode);

    final editController = useTextEditingController();
    final editFocusNode = useFocusNode();

    useSelectAll(editFocusNode, editController);

    final todoList = ref.read(todoListProvider.notifier);

    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (DismissDirection direction) => todoList.remove(todo),
      child: Material(
        color: Colors.white,
        elevation: 6,
        child: Focus(
          focusNode: focusNode,
          onFocusChange: (focused) {
            if (focused) {
              editController.text = todo.description;
            } else {
              // Commit changes only when the textfield is unfocused, for performance
              todoList.edit(id: todo.id, description: editController.text);
            }
          },
          child: ListTile(
            onTap: () {
              focusNode.requestFocus();
              editFocusNode.requestFocus();
            },
            leading: Checkbox(
              value: todo.completed,
              onChanged: (_) => todoList.toggle(todo.id),
            ),
            title: isFocused
                ? TextField(
                    autofocus: true,
                    focusNode: editFocusNode,
                    controller: editController,
                  )
                : Text(todo.description),
          ),
        ),
      ),
    );
  }
}
