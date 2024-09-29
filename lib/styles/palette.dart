import 'package:flutter/material.dart';

/*

IDEA:

1) Derivar de Map classe Shades amb constructor/constructors que obliguen l'existència dels 9 casos.
2) La classe PaletteColor es defineix per a un color concret, i el constructor fa servir final Shades
3) La classe Palette inclou els 5 PaletteColor demanats

Llavors es definirà:

static Map<String, PaletteColor> colors; observar que es farà servir un constructor factory

*/

class Palette {
  static const black = Colors.black45;
  static const mindaro = '#f2f8a0';
  static const persian_pink = '#f2f8a0';
  static const heliotrope = '#f2f8a0';
  static const chrysler_blue = '#f2f8a0';
  static const dark_purple = '#f2f8a0';
  static Map<String, Map<int, String>> colors = {
    'mindaro': {
      100: '#474c06',
      200: '#8e980b',
      300: '#d6e411',
      400: '#e8f254',
      500: '#f2f8a0',
      600: '#f5f9b3',
      700: '#f7fbc6',
      800: '#fafcd9',
      900: '#fcfeec',
    },
    'persian_pink': {},
    'heliotrope': {},
    'chrysler_blue': {},
    'dark_purple': {},
  };

  const Palette();
}

class Shades {
  late final Map<int, Color> shades;

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
  }) {
    shades = {
      100: shade100,
      200: shade200,
      300: shade300,
      400: shade400,
      500: shade500,
      600: shade600,
      700: shade700,
      800: shade800,
      900: shade900,
    };
  }

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

  operator [](int i) => shades[i]; // get
}

/* TODO - Create Factory to use shades[500] as primary
*/

class PaletteColor extends Color {
  /// Creates a color swatch with a variety of shades.
  ///
  /// The `primary` argument should be the 32 bit ARGB value of one of the
  /// values in the swatch, as would be passed to the [Color.new] constructor
  /// for that same color, and as is exposed by [value]. (This is distinct from
  /// the specific index of the color in the swatch.)
  const PaletteColor(super.primary, this.shades);

  final Shades shades;

  operator [](int i) => shades[i]; // get

  // default
  Color get color => this[500]!;

  /// The lightest shade.
  Color get shade100 => this[100]!;

  /// The second lightest shade.
  Color get shade200 => this[200]!;

  /// The third lightest shade.
  Color get shade300 => this[300]!;

  /// The fourth lightest shade.
  Color get shade400 => this[400]!;

  /// The default shade.
  Color get shade500 => this[500]!;

  /// The fourth darkest shade.
  Color get shade600 => this[600]!;

  /// The third darkest shade.
  Color get shade700 => this[700]!;

  /// The second darkest shade.
  Color get shade800 => this[800]!;

  /// The darkest shade.
  Color get shade900 => this[900]!;
}
