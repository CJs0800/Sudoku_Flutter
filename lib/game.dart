import 'dart:developer' as console;
import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'package:sudoku_starter/ExternalGrid.dart';
import 'package:sudoku_starter/ButtonGrid.dart';


class Game extends StatefulWidget {
  const Game({Key? key, required this.title, required this.isWinter, required this.validationCheck, required this.isErrorCounter}) : super(key: key);

  final String title;
  final bool isWinter;
  final bool validationCheck;
  final bool isErrorCounter;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int _counter = 0;
  int errorCounter = 0;
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
    if(widget.isWinter){
      generatePuzzleWinter();
    } else {
      generatePuzzle();
    }
  }

  Future<void> generatePuzzle() async{
    PuzzleOptions puzzleOptions = new PuzzleOptions();
    Puzzle puzzle = new Puzzle(puzzleOptions);
    await puzzle.generate();
    setState(() {
      this.puzzle = puzzle;
    });
  }
  Future<void> generatePuzzleWinter() async{
    PuzzleOptions puzzleOptions = new PuzzleOptions(patternName: "winter");
    Puzzle puzzle = new Puzzle(puzzleOptions);
    await puzzle.generate();
    setState(() {
      this.puzzle = puzzle;
    });
  }

  bool isSudokuComplete() {
    final board = puzzle?.board()?.matrix();
    final solution = puzzle?.solvedBoard()?.matrix();
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        if (board![r][c].getValue() != solution![r][c].getValue()) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble()/8*7;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: boxSize*3,
              height: boxSize/3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: boxSize,
                    height: boxSize/3,
                    child: TextButton(
                      onPressed: () {
                        context.go("/");
                      },
                      child: Text(
                        "Abandonner",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: boxSize/2),
            SizedBox(
              width: boxSize*3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(widget.isErrorCounter?errorCounter.toString()+" erreurs.":'')
                ],
              ),
            ),
            SizedBox(
              width: boxSize*3,
              height: boxSize*3,
              child: puzzle == null ? const Center(child: CircularProgressIndicator()) :
              Externalgrid(
                boxSize: boxSize,
                puzzle: puzzle,
                selectedRow: selectedRow,
                selectedCol: selectedCol,
                validationCheck: widget.validationCheck,
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
                puzzle: puzzle,
                boxSize: boxSize,
                selectedRow: selectedRow,
                selectedCol: selectedCol,
                onButtonPressed: (buttonNumber) {
                  setState(() {
                    Point point = Point(selectedRow!, selectedCol!);
                    Position position = Position(row: selectedRow!, column: selectedCol!);
                    position.grid = point;
                    puzzle?.board()!.cellAt(position).setValue(buttonNumber);
                    if (isSudokuComplete()){
                      context.go("/victory");
                    }
                    if (puzzle?.solvedBoard()?.cellAt(position).getValue() != buttonNumber && buttonNumber!=0){
                      errorCounter+=1;
                    }
                  });
                }),
            )
          ],
        )
      )
    );
  }
}
