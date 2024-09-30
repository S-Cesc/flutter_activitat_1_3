import 'package:flutter/material.dart';

class Shades {
  final Map<int, Color> _shades;

  Shades(
    shade100,
    shade200,
    shade300,
    shade400,
    shade500,
    shade600,
    shade700,
    shade800,
    shade900,
  ) : this.named(
          shade100: shade100,
          shade200: shade200,
          shade300: shade300,
          shade400: shade400,
          shade500: shade500,
          shade600: shade600,
          shade700: shade700,
          shade800: shade800,
          shade900: shade900,
        );

  Shades.named({
    required Color shade100,
    required Color shade200,
    required Color shade300,
    required Color shade400,
    required Color shade500,
    required Color shade600,
    required Color shade700,
    required Color shade800,
    required Color shade900,
  }) : _shades = Map.unmodifiable({
          100: shade100,
          200: shade200,
          300: shade300,
          400: shade400,
          500: shade500,
          600: shade600,
          700: shade700,
          800: shade800,
          900: shade900,
        });

  operator [](int i) => _shades.containsKey(i)
      ? _shades[i]
      : switch (i) {
          < 0 => throw RangeError('Index out of range: $i'),
          <= 100 => _shades[100],
          >= 900 => _shades[900],
          _ => _shades[((100 + 50) ~/ 100) * 100]
        };

  containsKey(int i) => _shades.containsKey(i);
}
