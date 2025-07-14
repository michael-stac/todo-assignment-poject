import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'future/todo/screens/todo_list_screen.dart';
import 'future/todo/service/todo_get_list_service_provider.dart'; // make sure the path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider()..fetchTodos(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true, // Ensures proper material design behavior
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Lato',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0, // Prevents shadow on scroll
            surfaceTintColor: Colors.transparent, // Prevents overlay on scroll
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Color(0xff344054),
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            brightness: Brightness.light,
          ),
        ),
        home:  TodoListScreen(),
      ),
    );
  }
}