import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

class Internalgrid extends StatelessWidget{
  const Internalgrid({
    Key?key,
    required this.blocRow,
    required this.blocCol,
    required this.puzzle,
    required this.selectedRow,
    required this.selectedCol,
    required this.onCellTap
  }) : super(key:key);

  final blocRow;
  final blocCol;
  final puzzle;
  final selectedRow;
  final selectedCol;
  final onCellTap;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (cellIndex) {
        int globalRow = blocRow * 3 + cellIndex ~/ 3;
        int globalCol = blocCol * 3 + cellIndex % 3;
        Cell cell = puzzle?.board()?.matrix()?[globalRow][globalCol];
        int val = cell.getValue() ?? 0;
        bool isGiven = cell.prefill()!;
        MaterialColor textColor = cell.getValue() == puzzle?.solvedBoard()?.matrix()?[globalRow][globalCol]?.getValue() ? Colors.green : Colors.red;
        bool isSelected = selectedCol == globalCol && selectedRow == globalRow;

        return InkWell(
          onTap: () { onCellTap(globalRow, globalCol); },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.3),
              color: isSelected ? Colors.blueAccent.shade100.withAlpha(100) : Colors.transparent
            ),
            child: Center(
              child: Text(
                val == 0 ? '' : val.toString(),
                style: TextStyle(color: isGiven ? Colors.black : textColor)
              )
            ),
          ),
        );
      }),
    );
  }
}