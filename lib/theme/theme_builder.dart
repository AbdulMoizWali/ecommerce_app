import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme/theme_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeBuilder {
  static ThemeData buildTheme(BuildContext context, Brightness brightness) {
    ThemeColors themeColors = LightThemeColors();
    if (brightness == Brightness.dark) {
      themeColors = DarkThemeColors();
    }

    return ThemeData(
      useMaterial3: true,
      splashColor: themeColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColors.primaryColor,
        brightness: brightness,
      ),
      textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme,
      ).apply(
        bodyColor: themeColors.textColor,
        displayColor: themeColors.textColor,
      ),
      iconTheme: IconThemeData(
        color: themeColors.primaryColor,
        size: 30,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          // foregroundColor: themeColors.primaryVariantColor,
          backgroundColor: Colors.transparent,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: themeColors.primaryVariantColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: themeColors.white,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: themeColors.white,
            style: BorderStyle.solid,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColors.primaryColor,
          foregroundColor: themeColors.primaryVariantColor,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          // backgroundColor: themeColors.primaryColor,
          foregroundColor: themeColors.textColor,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
