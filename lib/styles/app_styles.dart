import 'package:flutter/material.dart';

class AppStyles {
  static const _black = Colors.black45;
  static const _white = Colors.white;
  static const fonts = (
    fontFamilyName: 'Montserrat',
    display /*bigTitle*/ : TextStyle(
      inherit: false,
      fontSize: 40,
      color: _black,
    ),
    headline /*middleTitle*/ : TextStyle(
      inherit: false,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: _black,
    ),
    labelLarge /*distance*/ : TextStyle(
      inherit: false,
      fontSize: 24,
      color: _black,
    ),
    labelSmall /*activityType*/ : TextStyle(
      inherit: false,
      fontSize: 18,
      color: _black,
    ),
    labelSmallUndelined /*activityType*/ : TextStyle(
      fontSize: 18,
      decoration: TextDecoration.underline,
    ),
    body: TextStyle(
      inherit: false,
      fontSize: 14,
      color: _black,
    ),
    bodyItalic: TextStyle(
      inherit: false,
      fontSize: 14,
      color: _black,
      fontStyle: FontStyle.italic,
    ),
    bodyUnderlined: TextStyle(
      inherit: false,
      fontSize: 14,
      decoration: TextDecoration.underline,
    ),
  );
  static const colors = (
    black: _black,
    white: _white,
    mindaro: MaterialColor(0xFFf2f8a0, <int, Color>{
      100: Color(0xFF474c06),
      200: Color(0xFF8e980b),
      300: Color(0xFFd6e411),
      400: Color(0xFFe8f254),
      500: Color(0xFFf2f8a0),
      600: Color(0xFFf5f9b3),
      700: Color(0xFFf7fbc6),
      800: Color(0xFFfafcd9),
      900: Color(0xFFfcfeec),
    }),
    persianPink: MaterialColor(0xFFf896d8, <int, Color>{
      100: Color(0xFF4b0533),
      200: Color(0xFF960a67),
      300: Color(0xFFe00e9a),
      400: Color(0xFFf34bbb),
      500: Color(0xFFf896d8),
      600: Color(0xFFfaabdf),
      700: Color(0xFFfbc0e7),
      800: Color(0xFFfcd5ef),
      900: Color(0xFFfeeaf7),
    }),
    heliotrope: MaterialColor(0xFFbf63f8, <int, Color>{
      100: Color(0xFF2a0342),
      200: Color(0xFF540684),
      300: Color(0xFF7e09c7),
      400: Color(0xFFa321f5),
      500: Color(0xFFbf63f8),
      600: Color(0xFFcc82f9),
      700: Color(0xFFd8a1fb),
      800: Color(0xFFe5c1fc),
      900: Color(0xFFf2e0fe),
    }),
    chryslerBlue: MaterialColor(0xFF3407da, <int, Color>{
      100: Color(0xFF0a012c),
      200: Color(0xFF150357),
      300: Color(0xFF1f0483),
      400: Color(0xFF2a05ae),
      500: Color(0xFF3407da),
      600: Color(0xFF5021f8),
      700: Color(0xFF7c59fa),
      800: Color(0xFFa790fc),
      900: Color(0xFFd3c8fd),
    }),
    darkPurple: MaterialColor(0xFF181528, <int, Color>{
      100: Color(0xFF050408),
      200: Color(0xFF0a0810),
      300: Color(0xFF0e0d18),
      400: Color(0xFF131120),
      500: Color(0xFF181528),
      600: Color(0xFF3b3463),
      700: Color(0xFF5e539e),
      800: Color(0xFF9289c1),
      900: Color(0xFFc8c4e0),
    }),
  );

  // Invert color index for Brightness.dark mode
  // Caution: do not use when index is not invertible
  // pre: isIndexColorInvertible(i)
  static int colorIndex(Brightness mode, int i) {
    assert(isIndexColorInvertible(i));
    return mode == Brightness.light ? i : invertColorIndex(i);
  }

  // Used to compute colorIndex from Brightness Mode
  // Can also be used to obtain a valid contrast tone
  // Caution: index can't be out of range
  // pre: i >=0 && i <= 1000
  static int invertColorIndex(int i) {
    assert(i >= 0 && i <= 1000);
    return 1000 - i;
  }

  // It's only a valid tone when invertColorIndex will make an
  // enough contrast tone with actual tone; use:
  // light values between 0..300, but allows not normalized values up to 349
  // dark values bettween 700..1000, but allows not normalized values from 650
  // also note that zero and 1000 are not normalized values.
  static bool isIndexColorInvertible(int i) {
    return i >= 0 && i < 350 || i >= 650 && i <= 1000;
  }

  // Allow normalization of a computed color index
  // negative values are not allowed
  // post: return in {100, 200, 300, 400, 500, 600, 700, 800, 900}
  static int normalizeIndexColor(int i) {
    return switch (i) {
      < 0 => throw RangeError('Index out of range: $i'),
      < 150 => 100,
      >= 850 => 900,
      _ => ((100 + 50) ~/ 100) * 100
    };
  }
}
