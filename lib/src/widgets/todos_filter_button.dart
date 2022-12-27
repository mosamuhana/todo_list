import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';
import '../providers.dart';

class TodosFilterButton extends ConsumerWidget {
  final TodoListFilter filter;
  final String? tooltip;
  final String? title;

  const TodosFilterButton({
    super.key,
    required this.filter,
    this.tooltip,
    this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('### TodoFilterButton build (filter: ${filter.name})');
    final isSelected = ref.watch(todoListFilter.select((x) => x == filter));

    return Tooltip(
      message: tooltip ?? filter.name.capitalize(),
      child: TextButton(
        onPressed: () {
          if (!isSelected) {
            ref.read(todoListFilter.notifier).state = filter;
          }
        },
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          foregroundColor: MaterialStateProperty.all(
            isSelected ? Colors.blue : Colors.black,
          ),
        ),
        child: Text(title ?? filter.name.capitalize()),
      ),
    );
  }
}

extension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
