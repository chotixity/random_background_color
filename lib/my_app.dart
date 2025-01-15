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
        builder: (BuildContext context, Color color, _) {
          return Material(
            color: color,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: _randomColor.foregroundColor,
                builder: (BuildContext context, Color color, _) {
                  return Text(
                    'Hello, World!',
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
