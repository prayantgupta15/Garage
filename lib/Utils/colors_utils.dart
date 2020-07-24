import 'package:flutter/material.dart';

class ColorUtils {
  Color primarycolor = Colors.black;
//  HexColor("c10808");
  Color greycolor = HexColor("929794");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
