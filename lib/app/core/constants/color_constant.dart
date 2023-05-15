import 'package:flutter/material.dart';

import '/app/core/utils/extension/app_extension.dart';

mixin class ColorConstants {
  //0xFF vao` hex
  // static final MaterialColor blue100 = MaterialColor(0xFFE1EDF9, getSwatch(const Color(0xFFE1EDF9)));
  static final MaterialColor pink500 = MaterialColor(0xFFFFE6E6, getSwatch(const Color(0xFFFFE6E6)));
  static final MaterialColor pink800 = MaterialColor(0xFFF76969, getSwatch(const Color(0xFFF76969)));

  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    const lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }

  static Color hexToColor(String hex) {
    assert(hex.isHexColor, 'hex color must be #rrggbb or #rrggbbaa');

    return Color(
      int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xff000000 : 0x00000000),
    );
  }
}
