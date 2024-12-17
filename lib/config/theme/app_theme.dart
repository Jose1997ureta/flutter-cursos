import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int sslectedColor;

  AppTheme({this.sslectedColor = 0})
      : assert(sslectedColor >= 0 && sslectedColor <= _colorTheme.length - 1,
            "Colors must be between 0 and ${_colorTheme.length}");

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorTheme[sslectedColor]);
  }
}
