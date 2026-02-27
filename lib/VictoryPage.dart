import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VictoryPage extends StatelessWidget {
  const VictoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: (MediaQuery.of(context).size.width/8*7).ceil().toDouble(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.emoji_events,
                    size: 100,
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Félicitations!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Tu as réussi à compléter le sudoku.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      context.go("/");
                    },
                    child: const Text(
                      "Retour à l'acceuil",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
