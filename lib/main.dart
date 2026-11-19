import 'package:flutter/material.dart';

import 'views/input_page.dart';

void main() {
  runApp(const KalkulatorBmiApp());
}

class KalkulatorBmiApp extends StatelessWidget {
  const KalkulatorBmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const InputPage(),
    );
  }
}