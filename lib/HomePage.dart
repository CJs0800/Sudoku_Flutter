import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width/ 3).ceil().toDouble();
    var height = (MediaQuery.of(context).size.height / 2).ceil().toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sudoku-Flutter | Corentin JÉRÉ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: width,
              height: height/10,
            ),
            SizedBox(
              width: width,
              child: Center(
                child: Text(
                  "Bienvenu sur la version du Jeu 'Sudoku' que j'ai réalisé en Flutter.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height/2,
            ),
            SizedBox(
                width: width,
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/game');
                    },
                    child: Center(
                      child: Text("Jouer une partie", style: TextStyle(fontSize: 15)),
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
