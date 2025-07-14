import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String taskId;
  final String date;
  final String status;
  final String title;
  final String description;
  final VoidCallback onViewDetails;
  final VoidCallback onMarkCompleted;
  final Color borderColor;

  const TodoCard({
    Key? key,
    required this.taskId,
    required this.date,
    required this.status,
    required this.title,
    required this.description,
    required this.onViewDetails,
    required this.onMarkCompleted,
    this.borderColor = const Color(0xffFF6B00), // Default orange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Row - Task ID & Date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Task ID',
                        style: TextStyle(
                          color: Color(0xff667185),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '#$taskId',
                        style: TextStyle(
                          color: Color(0xff667185),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Color(0xff667185),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            /// Status Badge
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                decoration: BoxDecoration(
                  color: status == 'Completed' ? Color(0xffDCFCE7) : Color(0xffFEF6E7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: status == 'Completed' ? Colors.green : Color(0xff667185),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            Divider(color: Color(0xffE4E7EC)),

            /// Title & Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff344054),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff667185),
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Color(0xffE4E7EC)),

            /// View Details & Mark as Completed
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  GestureDetector(
                    onTap: onViewDetails,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.visibility_outlined, size: 18, color: Color(0xffFF6B00)),
                        SizedBox(width: 8),
                        Text(
                          'View Details',
                          style: TextStyle(
                            color: Color(0xffFF6B00),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
