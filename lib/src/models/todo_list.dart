import 'package:riverpod/riverpod.dart';

import 'todo.dart';

int _nextId = 3;

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description) {
    state = [
      ...state,
      Todo(
        id: ++_nextId,
        description: description,
      ),
    ];
  }

  void toggle(int id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(completed: !todo.completed)
        else // do nothing
          todo,
    ];
  }

  void edit({required int id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(description: description)
        else // do nothing
          todo,
    ];
  }

  void remove(Todo target) {
    removeById(target.id);
  }

  void removeById(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
