import 'package:flutter/material.dart';

class CercledIcon {
  static InkWell cercledIcon(
    IconData icon, {
    Function? onTap,
    double externalSize = 56,
    double internalSize = 50,
    double iconSize = 36,
    Color externalColor = Colors.blue,
    Color internalColor = Colors.white,
    Color iconColor = Colors.blue,
  }) {
    assert(externalSize > internalSize && internalSize > iconSize);
    return InkWell(
        onTap: onTap?.call(),
        child: Container(
          width: externalSize,
          height: externalSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: internalColor,
            border: Border.all(
              color: externalColor,
              width: externalSize - internalSize,
            ),
          ),
          child: Icon(icon, color: iconColor, size: iconSize),
        ));
  }
}
