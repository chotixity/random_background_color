import 'dart:ui';
import 'package:test/test.dart';
import 'package:test_application/domain/random_color.dart';

void main() {
  group("Test for the random color generation", () {
    final RandomColor randomColor = RandomColor();

    test("can generate a random color", () {
      randomColor.generateRandomColor();
      expect(randomColor.backgroundColor.value, isA<Color>());
    });

    test("does not repeat colors in the used colors list", () {
      final List<Color> usedColors = [];
      const int testSampleSize = 1000;

      for (int i = 0; i < testSampleSize; i++) {
        randomColor.generateRandomColor();
        final generatedColor = randomColor.backgroundColor.value;
        expect(usedColors.contains(generatedColor), false);
        usedColors.add(generatedColor);
      }
    });

    test("can compute the foreground color", () {
      const int blackColorValue = 0xFF000000;
      const int whiteColorValue = 0xFFFFFFFF;
      randomColor.backgroundColor.value = const Color(blackColorValue);
      randomColor.computeForegroundColor();
      expect(randomColor.foregroundColor.value, const Color(whiteColorValue));
    });
  });
}
