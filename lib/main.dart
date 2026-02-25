import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_starter/HomePage.dart';
import 'package:sudoku_starter/game.dart';

import 'VictoryPage.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) {
        final data = state.extra as Map?;
        return Game(
          title: "Sudoku-Flutter",
          isWinter: data?["isWinter"],
          validationCheck: data?["validationCheck"],
          isErrorCounter: data?["isErrorCounter"],
        );
      },
    ),
    GoRoute(
      path: '/victory',
      builder: (context, state) => const VictoryPage(),
    ),
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter_Sudoku_Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
