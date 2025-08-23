import 'package:flutter/material.dart';
import 'package:basics/gradient_container.dart';

const List<Color> gradientColors = [
  Color.fromARGB(255, 21, 24, 207),
  Color.fromARGB(255, 15, 1, 65),
];
void main() {
  runApp(
    // MaterialApp is used to provide Material Design styling
    // home: is named parameter
    const MaterialApp(
      home: Scaffold(body: GradientContainer(gradientColors: gradientColors)),
    ),
  );
}
