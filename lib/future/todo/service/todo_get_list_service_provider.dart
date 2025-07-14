import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  bool _isLoading = false;
  String _filter = 'All';
  String _searchQuery = '';

  List<Todo> get todos {
    List<Todo> filtered = [];

    if (_filter == 'Completed') {
      filtered = _todos.where((t) => t.completed).toList();
    } else if (_filter == 'In Progress') {
      filtered = _todos.where((t) => !t.completed).toList();
    } else {
      filtered = _todos;
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((t) => t.title.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return filtered;
  }

  bool get isLoading => _isLoading;
  String get filter => _filter;

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _todos = data.map((json) => Todo.fromJson(json)).toList();
    }
    _isLoading = false;
    notifyListeners();
  }

  void setFilter(String newFilter) {
    _filter = newFilter;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
