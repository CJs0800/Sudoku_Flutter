import 'package:flutter/material.dart';

class Internalgrid extends StatelessWidget{
  const Internalgrid({Key?key, required this.blocRow, required this.blocCol, required this.puzzle}) : super(key:key);

  final blocRow;
  final blocCol;
  final puzzle;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (cellIndex) {
        int globalRow = blocRow * 3 + cellIndex ~/ 3;
        int globalCol = blocCol * 3 + cellIndex % 3;
        int val = puzzle?.board()?.matrix()?[globalRow][globalCol]?.getValue() ?? 0;
        return Container(
          decoration: BoxDecoration( border: Border.all(color: Colors.black, width: 0.3) ),
          child: Center(
            child: Text(val == 0 ? '' : val.toString())
          ),
        );
      }),
    );
  }
}