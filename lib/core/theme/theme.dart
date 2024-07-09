import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ColorScheme lightColorScheme = const ColorScheme.light().copyWith(
    background: Pallete.kWhite,
    primary: Pallete.kBlue,
    secondary: Pallete.kYellow,
    error: Pallete.kRed,
  );

  static OutlineInputBorder _border({required borderColor}) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 4),
        borderRadius: BorderRadius.circular(10),
      );

  static final lightThemeMode = ThemeData.light().copyWith(
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: lightColorScheme.background,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: GoogleFonts.notoSans().fontFamily),
        foregroundColor: Pallete.kWhite,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _border(borderColor: lightColorScheme.primary),
        focusedBorder: _border(borderColor: lightColorScheme.secondary),
        errorBorder: _border(borderColor: lightColorScheme.error),
        focusedErrorBorder: _border(borderColor: lightColorScheme.error),
      ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
        color: lightColorScheme.background,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        fontSize: 18,
      )));

  static final darkThemeMode = ThemeData.dark().copyWith();
}
