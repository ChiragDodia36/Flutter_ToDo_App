import 'package:flutter/material.dart';

enum TaskPriority {
  crucial,
  important,
  lessImportant;

  String get displayName {
    switch (this) {
      case TaskPriority.crucial:
        return 'Crucial';
      case TaskPriority.important:
        return 'Important';
      case TaskPriority.lessImportant:
        return 'Less Important';
    }
  }

  Color getColor(bool isCompleted) {
    if (isCompleted) {
      return Colors.green;
    }
    switch (this) {
      case TaskPriority.crucial:
        return Colors.red;
      case TaskPriority.important:
        return Colors.orange;
      case TaskPriority.lessImportant:
        return Colors.yellow.shade700;
    }
  }

  IconData get icon {
    switch (this) {
      case TaskPriority.crucial:
        return Icons.priority_high;
      case TaskPriority.important:
        return Icons.warning_amber_rounded;
      case TaskPriority.lessImportant:
        return Icons.low_priority;
    }
  }
}

class Task {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final TaskPriority priority;
  final DateTime? dueDate;
  final bool hasReminder;

  Task({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    DateTime? createdAt,
    this.priority = TaskPriority.lessImportant,
    this.dueDate,
    this.hasReminder = false,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert Task to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'createdAt': createdAt.toIso8601String(),
      'priority': priority.index,
      'dueDate': dueDate?.toIso8601String(),
      'hasReminder': hasReminder ? 1 : 0,
    };
  }

  // Create Task from Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] == 1,
      createdAt: DateTime.parse(map['createdAt'] as String),
      priority: TaskPriority.values[map['priority'] as int? ?? 2],
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate'] as String) : null,
      hasReminder: map['hasReminder'] == 1,
    );
  }

  // Create a copy of Task with modified properties
  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    TaskPriority? priority,
    DateTime? dueDate,
    bool? hasReminder,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      hasReminder: hasReminder ?? this.hasReminder,
    );
  }

  Color get priorityColor => priority.getColor(isCompleted);

  // Due date helper methods
  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  bool get isDueToday {
    if (dueDate == null) return false;
    final now = DateTime.now();
    final due = dueDate!;
    return now.year == due.year && now.month == due.month && now.day == due.day;
  }

  bool get isDueSoon {
    if (dueDate == null || isCompleted) return false;
    final now = DateTime.now();
    final due = dueDate!;
    final difference = due.difference(now).inDays;
    return difference >= 0 && difference <= 3;
  }

  String get dueDateFormatted {
    if (dueDate == null) return '';
    
    final now = DateTime.now();
    final due = dueDate!;
    final difference = due.difference(now).inDays;
    
    if (difference == 0) return 'Today';
    if (difference == 1) return 'Tomorrow';
    if (difference == -1) return 'Yesterday';
    if (difference > 0) return 'In $difference days';
    if (difference < 0) return '${-difference} days ago';
    
    return '${due.day}/${due.month}/${due.year}';
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, description: $description, isCompleted: $isCompleted, priority: $priority, createdAt: $createdAt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted &&
        other.priority == priority &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isCompleted.hashCode ^
        priority.hashCode ^
        createdAt.hashCode;
  }
}
