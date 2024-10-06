import 'dart:ui';
import 'package:flutter/widgets.dart';

// The extension allows to place information about Brighness in the context 
// Example of use in the build method:
// @override
// Widget build(BuildContext context) {
//   final Widget logo = SvgPicture.asset(
//       context.isDarkMode ? "assets/logo_dark.svg" : "assets/logo.svg",
//       semanticsLabel: 'my logo');
// }
extension BrightnessMode on BuildContext {

  /// current brightness mode
  Brightness get brightness => MediaQuery.of(this).platformBrightness;

  /// is dark mode currently enabled?
  bool get isDarkMode {
    return brightness == Brightness.dark;
  }

}