import 'package:flutter/material.dart';
import 'package:sudoku_starter/InternalGrid.dart';

class Externalgrid extends StatelessWidget {
  const Externalgrid({
    Key? key,
    required this.boxSize,
    required this.puzzle,
    required this.selectedRow,
    required this.selectedCol,
    required this.onCellTap
  }) : super(key: key);

  final boxSize;
  final puzzle;
  final selectedRow;
  final selectedCol;
  final onCellTap;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (boxIndex) {
          int blocRow = boxIndex ~/ 3;
          int blocCol = boxIndex % 3;
          return Container(
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Internalgrid(
              blocRow: blocRow,
              blocCol: blocCol,
              puzzle: puzzle,
              selectedRow: selectedRow,
              selectedCol: selectedCol,
              onCellTap: onCellTap
            ),
          );
        })
    );
  }
}