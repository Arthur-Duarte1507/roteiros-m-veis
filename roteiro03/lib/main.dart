import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const Roteiro02App());
}

class Roteiro02App extends StatelessWidget {
  const Roteiro02App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roteiro 02',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HomeScreen(),
    );
  }
}
