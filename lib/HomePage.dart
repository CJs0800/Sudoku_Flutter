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
    var width = (MediaQuery.of(context).size.width/ 2).ceil().toDouble();
    var height = (MediaQuery.of(context).size.height / 2).ceil().toDouble();
    var buttonList = [
      SizedBox(
          width: width/4,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isWinter ? isWinter=false : isWinter=true;
                });
              },
              child: Text(
                  isWinter ? "Activer la grille aléatoire" : "Activer le mode Winter"
              )
          )
      ),
      SizedBox(
        width: width/4,
        child: ElevatedButton(
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
                validationCheck ? "Ne pas afficher les erreurs" : "Afficher les erreurs"
            )
        ),
      ),
      SizedBox(
        width: width/4,
        child: ElevatedButton(
            onPressed: validationCheck ?
                () {
              setState(() {
                isErrorCounter ? isErrorCounter=false : isErrorCounter=true;
              });
            } : null,
            child: Text(
                isErrorCounter ? "Ne pas compter les erreurs" : "Compter les erreurs"
            )
        ),
      )
    ];

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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: width/8,
                  children: [
                    SizedBox(
                      width: width/4,
                      child: Text(
                        isWinter ?
                        "La grille du sudoku sera généré avec la forme Winter." :
                        "La grille du sudiku sera généré aléatoirement.",
                        textAlign: TextAlign.center,
                      )
                    ),
                    SizedBox(
                      width: width/4,
                      child: Text(
                        validationCheck ?
                        "Les erreurs s'afficheront sur la grille de jeu." :
                        "Les erreurs ne s'afficheront pas sur la grille de jeu.",
                        textAlign: TextAlign.center,
                      )
                    ),
                    SizedBox(
                      width: width/4,
                      child: Text(
                        isErrorCounter ?
                        "Le nombre d'erreurs sera visible sur un compteur." :
                        "Le nombre d'erreurs ne sera pas visible sur un compteur.",
                        textAlign: TextAlign.center,
                      )
                    )
                  ],
                )
            ),
            SizedBox(
              height: height/100,
            ),
            SizedBox(
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: width/8,
                children: [
                  SizedBox(
                    width: width/4,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isWinter ? isWinter=false : isWinter=true;
                        });
                      },
                      child: Text(
                        isWinter ? "Activer la grille aléatoire" : "Activer le mode Winter"
                      )
                    )
                  ),
                  SizedBox(
                    width: width/4,
                    child: ElevatedButton(
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
                        validationCheck ? "Ne pas afficher les erreurs" : "Afficher les erreurs"
                      )
                    ),
                  ),
                  SizedBox(
                    width: width/4,
                    child: ElevatedButton(
                      onPressed: validationCheck ?
                        () {
                          setState(() {
                            isErrorCounter ? isErrorCounter=false : isErrorCounter=true;
                          });
                        } : null,
                      child: Text(
                        isErrorCounter ? "Ne pas compter les erreurs" : "Compter les erreurs"
                      )
                    ),
                  )
                ],
              )
            ),
            SizedBox(
              height: height/10,
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
