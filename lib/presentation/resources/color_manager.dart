import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#4472C4');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');

  static Color darkPrimary = HexColor.fromHex('#D17D11');
  static Color grey1 = HexColor.fromHex('#707070');
  static Color grey2 = HexColor.fromHex('#797979');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color black = HexColor.fromHex('#000000');
  static Color error = HexColor.fromHex('#E61F34');
}

extension HexColor on Color {
  static Color fromHex(String hexColorSting) {
    hexColorSting = hexColorSting.replaceAll('#', '');
    if (hexColorSting.length == 6) {
      hexColorSting = 'FF' + hexColorSting;
    }
    return Color(int.parse(hexColorSting, radix: 16));
  }
}
