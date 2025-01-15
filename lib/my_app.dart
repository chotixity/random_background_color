import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_application/domain/random_color.dart';

///Creates a [MyApp] widget.
class MyApp extends StatefulWidget {
  ///[MyApp] widget constructor.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _randomColor.generateRandomColor,
      child: ValueListenableBuilder(
        valueListenable: _randomColor.backgroundColor,
        builder: (BuildContext context, Color color, _) {
          return Material(
            color: color,
            child: const Center(
              child: Text(
                'Hello, World!',
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        },
      ),
    );
  }
}
