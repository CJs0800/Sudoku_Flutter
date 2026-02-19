import 'package:flutter/material.dart';

class Buttongrid extends StatelessWidget {
  const Buttongrid({
    Key? key,
    required this.boxSize,
    required this.selectedRow,
    required this.selectedCol,
    required this.onButtonPressed,
  }) : super(key:key);

  final boxSize;
  final selectedRow;
  final selectedCol;
  final onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      mainAxisSpacing: boxSize~/9,
      crossAxisSpacing: boxSize~/6,
      childAspectRatio: 1.5,
      children: List.generate(10, (buttonIndex) {
        bool isEnable = selectedRow != null && selectedCol != null;
        final ButtonStyle style = ElevatedButton.styleFrom(alignment: Alignment.center);
        return ElevatedButton(
          onPressed: isEnable ? () { onButtonPressed(buttonIndex==9 ? 0 : buttonIndex+1); } : null,
          style: style,
          child: Text(buttonIndex==9 ? '⌫' : (buttonIndex+1).toString()),
        );
      }),
    );
  }
}