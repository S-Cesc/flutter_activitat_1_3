import 'package:flutter/material.dart';
import 'shades.dart';

class PaletteColor extends Color {
  /// Creates a color swatch with a variety of shades.
  ///
  /// The `primary` argument should be the 32 bit ARGB value of one of the
  /// values in the swatch, as would be passed to the [Color.new] constructor
  /// for that same color, and as is exposed by [value]. (This is distinct from
  /// the specific index of the color in the swatch.)
  const PaletteColor._(super.primary, this.shades);

  factory PaletteColor(Shades shades) {
    assert(shades.containsKey(100));
    assert(shades.containsKey(200));
    assert(shades.containsKey(300));
    assert(shades.containsKey(400));
    assert(shades.containsKey(500));
    assert(shades.containsKey(600));
    assert(shades.containsKey(700));
    assert(shades.containsKey(800));
    assert(shades.containsKey(900));
    return PaletteColor._(shades[500], shades); // :
  }

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
