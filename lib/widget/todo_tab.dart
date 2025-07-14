import 'package:flutter/material.dart';

class TodoTabBar extends StatefulWidget {
  final Function(String) onTabSelected;

  const TodoTabBar({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  State<TodoTabBar> createState() => _TodoTabBarState();
}

class _TodoTabBarState extends State<TodoTabBar> {
  String selected = 'All';

  // Updated to just use labels, no numbers
  final List<String> tabs = ['All', 'In Progress', 'Completed'];

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: tabs.map((tab) {
                  final isActive = selected == tab;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = tab;
                      });
                      widget.onTabSelected(tab);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          tab,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isActive ? const Color(0xffFF6B00) : const Color(0xff667185),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 2,
                          width: 40,
                          color: isActive ? const Color(0xffFF6B00) : Colors.transparent,
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
