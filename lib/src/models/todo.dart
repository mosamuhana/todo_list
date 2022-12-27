class Todo {
  final int id;
  final String description;
  final bool completed;

  const Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  Todo copyWith({int? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      description: map['description'] as String,
      completed: map['completed'] as bool,
    );
  }

  @override
  String toString() =>
      'Todo(id: $id, description: $description, completed: $completed)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;
    return other.id == id &&
        other.description == description &&
        other.completed == completed;
  }

  @override
  int get hashCode => Object.hash(id, description, completed);
}
