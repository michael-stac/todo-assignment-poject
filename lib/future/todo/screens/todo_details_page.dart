import 'package:flutter/material.dart';

class TodoDetailPage extends StatelessWidget {
  final String taskId;
  final String title;
  final String description;
  final String status;
  final String date;

  const TodoDetailPage({
    Key? key,
    required this.taskId,
    required this.title,
    required this.description,
    required this.status,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'Completed'
        ? Colors.green
        : status == 'In Progress'
        ? Colors.orange
        : Colors.grey;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black,),
        title: const Text('Todo Details',  style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Color(0xffFF6B00),
        ),),

        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black,),
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
                                'Edit Todo',
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
                                'Edit',
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
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildDetailTile(
            icon: Icons.assignment_outlined,
            label: 'Task ID',
            value: taskId,
          ),
          const SizedBox(height: 12),
          _buildDetailTile(
            icon: Icons.title,
            label: 'Title',
            value: title,
          ),
          const SizedBox(height: 12),
          _buildDetailTile(
            icon: Icons.notes_outlined,
            label: 'Description',
            value: description,
          ),
          const SizedBox(height: 12),
          _buildDetailTile(
            icon: Icons.flag_outlined,
            label: 'Status',
            value: status,
            valueColor: statusColor,
          ),
          const SizedBox(height: 12),
          _buildDetailTile(
            icon: Icons.calendar_today_outlined,
            label: 'Date Created',
            value: date,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailTile({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  color: valueColor ?? Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
