import 'package:flutter/material.dart';
import 'package:toonflix/screens/bottom.dart';
import 'package:toonflix/widgets/button_widget.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red
          ),
        ),
      ),
      home: BottomScreen(),
    );
  }
}
