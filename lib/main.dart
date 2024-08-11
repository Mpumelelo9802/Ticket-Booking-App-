import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:booktickets/screens/bottom_bar.dart'; // Ensure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const BottomBar(), // Use BottomBar as the home widget
    );
  }
}
