import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_assignment_project/future/todo/screens/todo_details_page.dart';

import '../../../widget/todo_card.dart';
import '../../../widget/todo_tab.dart';
import '../service/todo_get_list_service_provider.dart';


class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).fetchTodos();
  }

  @override

  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todos = todoProvider.todos;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFF6B00),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          'Todos',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Color(0xff344054),
          ),
        ),
      ),
      body: todoProvider.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Column(
        children: [
          TodoTabBar(
            onTabSelected: (tab) {
              todoProvider.setFilter(tab);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: _buildSearchBar(todoProvider),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TodoCard(
                    taskId: 'TODO-${todo.id}',
                    date: 'Jul 13, 2025',
                    status: todo.completed ? 'Completed' : 'In Progress',
                    title: todo.title,
                    description: 'User ID: ${todo.userId}',
                    onViewDetails: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TodoDetailPage(
                            taskId: 'TODO-${todo.id}',
                            title: todo.title,
                            description: 'User ID: ${todo.userId}',
                            status: todo.completed ? 'Completed' : 'In Progress',
                            date: 'Jul 13, 2025',
                          ),
                        ),
                      );
                    },
                    onMarkCompleted: () {
                      print("Mark as Completed tapped for ID: ${todo.id}");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(TodoProvider todoProvider) {
    return TextField(
      onChanged: (value) {
        todoProvider.updateSearchQuery(value);
      },
      decoration: InputDecoration(
        hintText: 'Search todos...',
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.search),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
    );
  }
  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add New Todo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.close, color: Colors.grey[700]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: const Color(0xffFF6B00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final title = titleController.text.trim();
                      final description = descriptionController.text.trim();
                      if (title.isNotEmpty && description.isNotEmpty) {
                        print('Todo added:\nTitle: $title\nDescription: $description\nDate: $currentDate');
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'Add Todo',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
