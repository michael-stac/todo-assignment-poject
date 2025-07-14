import 'package:flutter/material.dart';

class TodoTabBar extends StatefulWidget {
  final Function(String) onTabSelected;

  const TodoTabBar({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  State<TodoTabBar> createState() => _TodoTabBarState();
}

class _TodoTabBarState extends State<TodoTabBar> {
  String selected = 'All';

  // Removed "Pending"
  final Map<String, int> tabs = {
    'All': 15,
    'In Progress': 5,
    'Completed': 2,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: tabs.entries.map((entry) {
                  final isActive = selected == entry.key;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = entry.key;
                      });
                      widget.onTabSelected(entry.key);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IntrinsicWidth(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    entry.key,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isActive ? Color(0xffFF6B00) : Color(0xff667185),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '${entry.value}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: isActive ? Color(0xffFF6B00) : Color(0xff475367),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Container(
                                height: 2,
                                color: isActive ? Color(0xffFF6B00) : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
