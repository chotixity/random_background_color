import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

///A class for handling the random color generation
class RandomColor {
  ///The current generated background color
  final ValueNotifier<Color> backgroundColor =
      ValueNotifier<Color>(Colors.white);

  ///The current generated foreground color
  final ValueNotifier<Color> foregroundColor =
      ValueNotifier<Color>(Colors.black);
  final List<Color> _usedColors = [];

  ///A List to add used colors to ensure none is repeated
  final Random _random = Random();
  final int _maxRGBValue = 256;

  ///The cube value
  final cubeValue = 3;

  ///The Random backgroundColor generation method
  void generateRandomColor() {
    /// Generates
    Color generatedColor;
    do {
      generatedColor = Color.fromRGBO(
        _random.nextInt(_maxRGBValue),
        _random.nextInt(_maxRGBValue),
        _random.nextInt(_maxRGBValue),
        1,
      );
    } while (_usedColors.contains(backgroundColor.value) &&
        _usedColors.length < pow(_maxRGBValue, cubeValue));

    ///Computes the foreground color for the generated background
    computeForegroundColor();

    if (!_usedColors.contains(generatedColor)) {
      _usedColors.add(backgroundColor.value);
      backgroundColor.value = generatedColor;
    }
  }

  ///A method to compute the foreground color based on the background color luminance
  void computeForegroundColor() {
    final Color currentColor = backgroundColor.value;
    final luminance = currentColor.computeLuminance();
    final Color currentforegroundColor =
        luminance > 0.5 ? Colors.black : Colors.white;
    foregroundColor.value = currentforegroundColor;
  }
}
