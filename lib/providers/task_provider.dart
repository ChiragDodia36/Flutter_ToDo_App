import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/database_service.dart';

class TaskProvider extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService.instance;
  List<Task> _tasks = [];
  bool _isLoading = false;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  // Get completed tasks
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  // Get pending tasks
  List<Task> get pendingTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  // Load all tasks from database
  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await _databaseService.readAllTasks();
    } catch (e) {
      debugPrint('Error loading tasks: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new task
  Future<void> addTask(Task task) async {
    try {
      final newTask = await _databaseService.createTask(task);
      _tasks.insert(0, newTask); // Add to beginning of list
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding task: $e');
      rethrow;
    }
  }

  // Update an existing task
  Future<void> updateTask(Task task) async {
    try {
      await _databaseService.updateTask(task);
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = task;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating task: $e');
      rethrow;
    }
  }

  // Toggle task completion status
  Future<void> toggleTaskCompletion(Task task) async {
    try {
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      await updateTask(updatedTask);
    } catch (e) {
      debugPrint('Error toggling task completion: $e');
      rethrow;
    }
  }

  // Delete a task
  Future<void> deleteTask(int id) async {
    try {
      await _databaseService.deleteTask(id);
      _tasks.removeWhere((task) => task.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting task: $e');
      rethrow;
    }
  }

  // Get a single task by id
  Task? getTaskById(int id) {
    try {
      return _tasks.firstWhere((task) => task.id == id);
    } catch (e) {
      return null;
    }
  }

  // Delete all tasks
  Future<void> deleteAllTasks() async {
    try {
      await _databaseService.deleteAllTasks();
      _tasks.clear();
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting all tasks: $e');
      rethrow;
    }
  }
}

