import 'package:flutter/material.dart';
import 'palette_color.dart';
import 'shades.dart';

class AppStyles {
  static const fonts = (
    fontFamilyName: 'Montserrat',
    display /*bigTitle*/: TextStyle(fontSize: 40),
    headline /*middleTitle*/: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    labelLarge /*distance*/: TextStyle(fontSize: 24),
    labelSmall /*activityType*/: TextStyle(fontSize: 18),
    body: TextStyle(fontSize: 14),
  );

  static final colors = (
    black: Colors.black45,
    mindaro: PaletteColor(Shades.named(
      shade100: const Color(0xFF474c06),
      shade200: const Color(0xFF8e980b),
      shade300: const Color(0xFFd6e411),
      shade400: const Color(0xFFe8f254),
      shade500: const Color(0xFFf2f8a0),
      shade600: const Color(0xFFf5f9b3),
      shade700: const Color(0xFFf7fbc6),
      shade800: const Color(0xFFfafcd9),
      shade900: const Color(0xFFfcfeec),
    )),
    persianPink: PaletteColor(Shades.named(
      shade100: const Color(0xFF4b0533),
      shade200: const Color(0xFF960a67),
      shade300: const Color(0xFFe00e9a),
      shade400: const Color(0xFFf34bbb),
      shade500: const Color(0xFFf896d8),
      shade600: const Color(0xFFfaabdf),
      shade700: const Color(0xFFfbc0e7),
      shade800: const Color(0xFFfcd5ef),
      shade900: const Color(0xFFfeeaf7),
    )),
    heliotrope: PaletteColor(Shades.named(
      shade100: const Color(0xFF2a0342),
      shade200: const Color(0xFF540684),
      shade300: const Color(0xFF7e09c7),
      shade400: const Color(0xFFa321f5),
      shade500: const Color(0xFFbf63f8),
      shade600: const Color(0xFFcc82f9),
      shade700: const Color(0xFFd8a1fb),
      shade800: const Color(0xFFe5c1fc),
      shade900: const Color(0xFFf2e0fe),
    )),
    chryslerBlue: PaletteColor(Shades.named(
      shade100: const Color(0xFF0a012c),
      shade200: const Color(0xFF150357),
      shade300: const Color(0xFF1f0483),
      shade400: const Color(0xFF2a05ae),
      shade500: const Color(0xFF3407da),
      shade600: const Color(0xFF5021f8),
      shade700: const Color(0xFF7c59fa),
      shade800: const Color(0xFFa790fc),
      shade900: const Color(0xFFd3c8fd),
    )),
    darkPurple: PaletteColor(Shades.named(
      shade100: const Color(0xFF050408),
      shade200: const Color(0xFF0a0810),
      shade300: const Color(0xFF0e0d18),
      shade400: const Color(0xFF131120),
      shade500: const Color(0xFF181528),
      shade600: const Color(0xFF3b3463),
      shade700: const Color(0xFF5e539e),
      shade800: const Color(0xFF9289c1),
      shade900: const Color(0xFFc8c4e0),
    )),
  );

}
