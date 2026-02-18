import 'package:flutter/material.dart';
import 'package:sudoku_starter/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Sudoku_Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game(title: "Sudoku_Flutter_Game")
    );
  }
}
