import 'package:flutter/material.dart';

abstract class ThemeColors {
  Color primaryColor = const Color(0xFFaa14f0);
  Color primaryVariantColor = const Color(0xFFe4abff);
  Color pureWhite = const Color(0xFFFFFFFF);
  Color white = const Color(0xFFD9D9D9);
  Color whiteSmoke = const Color(0xFFFAFAFA);
  Color blue = const Color(0xFF4a85fd);
  Color red = const Color(0xFFc42b1c);
  Color green = const Color(0xFF1dbf73);
  Color textColor = const Color(0xFF000000);
  Color black = const Color(0xFF000000);

  static ThemeColors getThemeColors(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    if (brightness == Brightness.dark) {
      return DarkThemeColors();
    } else {
      return LightThemeColors();
    }
  }
}

class LightThemeColors extends ThemeColors {
  LightThemeColors() {
    super.primaryColor = const Color(0xFFaa14f0);
    super.pureWhite = const Color(0xFFFFFFFF);
    super.white = const Color(0xFFD9D9D9);
    super.whiteSmoke = const Color(0xFFFAFAFA);
    super.blue = const Color(0xFF4a85fd);
    super.red = const Color(0xFFc42b1c);
    super.green = const Color(0xFF1dbf73);
    super.textColor = const Color(0xFF000000);
    super.black = const Color(0xFF000000);
  }
}

class DarkThemeColors extends ThemeColors {
  DarkThemeColors() {
    super.primaryColor = const Color(0xFF323232);
    super.pureWhite = const Color(0xFF323235);
    super.white = const Color(0xFFFFFFFF);
    super.blue = const Color(0xFF4a85fd);
    super.red = const Color(0xFFc42b1c);
    super.green = const Color(0xFF1dbf73);
    textColor = const Color(0xFFeeeeee);
  }
}
