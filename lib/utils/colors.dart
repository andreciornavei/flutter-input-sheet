import 'package:flutter/material.dart';

class IpsColors {
  static MaterialColor dark = IpsColors.factoryColor(0xff2A2A2A);
  static MaterialColor gray = IpsColors.factoryColor(0xff707070);
  static MaterialColor mute = IpsColors.factoryColor(0xff9EA4B9);
  static MaterialColor red = IpsColors.factoryColor(0xffF98E81);
  static MaterialColor light = IpsColors.factoryColor(0xfff4f4f4);
  static MaterialColor shadow = IpsColors.factoryColor(0xffE7EAF0);
  static MaterialColor border = IpsColors.factoryColor(0xffD8D8D8);
  static MaterialColor white = IpsColors.factoryColor(0xffffffff);
  static MaterialColor factoryColor(int color) {
    return MaterialColor(
      color,
      <int, Color>{
        50: Color(color),
        100: Color(color),
        200: Color(color),
        300: Color(color),
        400: Color(color),
        500: Color(color),
        600: Color(color),
        700: Color(color),
        800: Color(color),
        900: Color(color),
      },
    );
  }
}
