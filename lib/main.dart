import 'package:animations_experiments/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //ffrrr4444
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
