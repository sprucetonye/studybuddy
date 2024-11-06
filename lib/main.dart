import 'package:flutter/material.dart';
import 'package:studybuddy/pages/home_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

