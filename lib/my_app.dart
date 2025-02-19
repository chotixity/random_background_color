import 'package:flutter/material.dart';
import 'package:random_background_color/domain/random_color.dart';

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
        builder: (_, Color color, __) {
          return Material(
            color: color,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: _randomColor.foregroundColor,
                builder: (_, Color color, __) {
                  return Text(
                    'Hello, there',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: color),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
