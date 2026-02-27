import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _counter = 0;
  bool isWinter = false;
  bool isErrorCounter = true;
  bool validationCheck = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = (MediaQuery.of(context).size.width).ceil().toDouble();
    var width = (MediaQuery.of(context).size.width/ 2).ceil().toDouble();
    var height = (MediaQuery.of(context).size.height / 2).ceil().toDouble();
    var isVertical = screenWidth < height;

    // Responsive width.
    if (screenWidth < 1000) {
      width = (MediaQuery.of(context).size.width/4*3).ceil().toDouble();
    } if (screenWidth <= 660) {
      width = (MediaQuery.of(context).size.width/8*7).ceil().toDouble();
    }

    // Component Initialization
    Center welcomeText = Center(
      child: Text(
        "Bienvenu sur la version du Jeu 'Sudoku' que j'ai réalisé en Flutter.",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );

    Text gridGenerationText = Text(
      isWinter ?
      "La grille du sudoku sera généré avec la forme Winter." :
      "La grille du sudiku sera généré aléatoirement.",
      textAlign: TextAlign.center,
    );
    ElevatedButton gridGenerationButton = ElevatedButton(
        onPressed: () {
          setState(() {
            isWinter ? isWinter=false : isWinter=true;
          });
        },
        child: Text(
          isWinter ? "Activer la grille aléatoire" : "Activer le mode Winter",
          textAlign: TextAlign.center,
        )
    );

    Text validationCheckText = Text(
      validationCheck ?
      "Les erreurs s'afficheront sur la grille de jeu." :
      "Les erreurs ne s'afficheront pas sur la grille de jeu.",
      textAlign: TextAlign.center,
    );
    ElevatedButton validationCheckButton = ElevatedButton(
        onPressed: () {
          setState(() {
            if (validationCheck) {
              isErrorCounter=false;
              validationCheck=false;
            } else {
              validationCheck = true;
            }
          });
        },
        child: Text(
          validationCheck ? "Ne pas afficher les erreurs" : "Afficher les erreurs",
          textAlign: TextAlign.center,
        )
    );

    Text errorCounterText = Text(
      isErrorCounter ?
      "Le nombre d'erreurs sera visible sur un compteur." :
      "Le nombre d'erreurs ne sera pas visible sur un compteur.",
      textAlign: TextAlign.center,
    );
    ElevatedButton errorCounterButton = ElevatedButton(
        onPressed: validationCheck ?
            () { setState(() {
          isErrorCounter ? isErrorCounter=false : isErrorCounter=true;
        }); } : null,
        child: Text(
          isErrorCounter ? "Ne pas compter les erreurs" : "Compter les erreurs",
          textAlign: TextAlign.center,
        )
    );


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
              child: welcomeText,
            ),
            SizedBox(
              width: width,
              height: height/5*2,
            ),
            SizedBox(
              width: width,
              child: isVertical||screenWidth<560 ?
              Column(
                spacing: height/20,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: width/16,
                    children: [
                      SizedBox(
                        width: width/32*15,
                        child: gridGenerationText,
                      ),
                      SizedBox(
                        width: width/32*15,
                        child: gridGenerationButton,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: width/16,
                    children: [
                      SizedBox(
                        width: width/32*15,
                        child: validationCheckText,
                      ),
                      SizedBox(
                        width: width/32*15,
                        child: validationCheckButton,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: width/16,
                    children: [
                      SizedBox(
                        width: width/32*15,
                        child: errorCounterText,
                      ),
                      SizedBox(
                        width: width/32*15,
                        child: errorCounterButton,
                      ),
                    ],
                  )
                ],
              ):
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: width/16,
                children: [
                  Column(
                    spacing: height/100,
                    children: [
                      SizedBox(
                        width: width/24*7,
                        child: gridGenerationText,
                      ),
                      SizedBox(
                        width: width/24*7,
                        child: gridGenerationButton,
                      ),
                    ],
                  ),
                  Column(
                    spacing: height/100,
                    children: [
                      SizedBox(
                        width: width/24*7,
                        child: validationCheckText,
                      ),
                      SizedBox(
                        width: width/24*7,
                        child: validationCheckButton,
                      ),
                    ],
                  ),
                  Column(
                    spacing: height/100,
                    children: [
                      SizedBox(
                        width: width/24*7,
                        child: errorCounterText,
                      ),
                      SizedBox(
                        width: width/24*7,
                        child: errorCounterButton,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height/8,
            ),
            SizedBox(
                width: width,
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/game',
                        extra: {
                          "isWinter": isWinter,
                          "validationCheck": validationCheck,
                          "isErrorCounter": isErrorCounter,
                        },
                      );
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
