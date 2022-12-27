import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/models.dart';
import 'todos_filter_button.dart';
import 'todos_remaining_text.dart';

class TodosFilters extends StatelessWidget {
  const TodosFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('### TodoToolbar build');
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            child: TodosRemainingText(),
          ),
          TodosFilterButton(
            filter: TodoListFilter.all,
            title: 'All',
            tooltip: 'All todos',
          ),
          TodosFilterButton(
            filter: TodoListFilter.active,
            title: 'Active',
            tooltip: 'Only uncompleted todos',
          ),
          TodosFilterButton(
            filter: TodoListFilter.completed,
            title: 'Completed',
            tooltip: 'Only completed todos',
          ),
        ],
      ),
    );
  }
}
