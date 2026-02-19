import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'package:sudoku_starter/ExternalGrid.dart';
import 'package:sudoku_starter/ButtonGrid.dart';


class Game extends StatefulWidget {
  const Game({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int _counter = 0;
  Puzzle? puzzle;
  int? selectedRow;
  int? selectedCol;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState(){
    super.initState();
    generatePuzzle();
  }

  Future<void> generatePuzzle() async{
    PuzzleOptions puzzleOptions = new PuzzleOptions(patternName: "winter");
    Puzzle puzzle = new Puzzle(puzzleOptions);
    await puzzle.generate();
    setState(() {
      this.puzzle = puzzle;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: boxSize*3,
              height: boxSize*3,
              child: Externalgrid(
                boxSize: boxSize,
                puzzle: puzzle,
                selectedRow: selectedRow,
                selectedCol: selectedCol,
                onCellTap: (row, col) {
                  setState(() {
                    selectedRow = row;
                    selectedCol = col;
                  });
                },
              ),
            ),
            SizedBox(height: boxSize*0.15),
            SizedBox(
              width: boxSize*3,
              height: boxSize,
              child: Buttongrid(
                boxSize: boxSize,
                selectedRow: selectedRow,
                selectedCol: selectedCol,
                onButtonPressed: (buttonNumber) {
                  setState(() {
                    Point point = Point(selectedRow!, selectedCol!);
                    Position position = Position(row: selectedRow!, column: selectedCol!);
                    position.grid = point;
                    puzzle?.board()!.cellAt(position).setValue(buttonNumber);
                  });
                }),
            )
          ],
        )
      )
    );
  }
}
