import 'package:flutter/material.dart';
import 'package:todo_assignment_project/future/todo/screens/todo_details_page.dart';

import '../../../widget/todo_card.dart';
import '../../../widget/todo_tab.dart';


class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  static const String routeName = '/deliveries';

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  String selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFF6B00),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController titleController = TextEditingController();
              final TextEditingController descriptionController = TextEditingController();
              final String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Top Row with Title and Close Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
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

                      /// Title Field
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// Description Field
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),

                      /// Full-width Add Button
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

        },

        child: Icon(Icons.add, color: Colors.white,),),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Todos',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Color(0xff344054),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildSearchBar(),
                  ),
                  TodoTabBar(
                    onTabSelected: (tab) {
                      setState(() {
                        selectedTab = tab;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                    child: TodoCard(
                      taskId: 'TODO-001',
                      date: 'Jul 13, 2025',
                      status: 'In Progress',
                      title: 'Design Flutter Todo UI',
                      description: 'Create UI for list screen and detail screen with update and complete actions.',
                      onViewDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TodoDetailPage(
                              taskId: 'TODO-001',
                              title: 'Design Flutter Todo UI',
                              description: 'Create UI for list screen and detail screen with update and complete actions.',
                              status: 'In Progress',
                              date: 'Jul 13, 2025',
                            ),
                          ),
                        );
                      },

                      onMarkCompleted: () {
                        print("Mark as Completed tapped");
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
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
}
