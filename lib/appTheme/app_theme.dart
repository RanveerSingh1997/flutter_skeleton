import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';


class AppTheme{
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
  themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData =
  themeData(lightColorScheme, _lightFocusColor);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryColor,
    primaryVariant: secondaryDarkColor,
    secondary: secondaryColor,
    secondaryVariant: primaryLightColor,
    surface: Colors.white,
    background: Colors.white,
    error: _lightFillColor,
    onPrimary: primaryDarkColor,
    onSecondary: secondaryDarkColor,
    onSurface: secondaryDarkColor,
    onBackground: Colors.white,
    onError: _lightFillColor,
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w500;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.roboto(),
    headline2: GoogleFonts.roboto(),
    headline3: GoogleFonts.roboto(),
    headline4: GoogleFonts.roboto(),
    headline5: GoogleFonts.roboto(),
    headline6: GoogleFonts.roboto(),
    subtitle1: GoogleFonts.roboto(fontWeight: _semiBold),
    subtitle2: GoogleFonts.roboto(),
    bodyText1: GoogleFonts.roboto(),
    bodyText2: GoogleFonts.roboto(),
    button: GoogleFonts.roboto(fontWeight: _bold),
    overline: GoogleFonts.roboto(),
    caption: GoogleFonts.roboto(),
  );

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.orange;
        }),
      ),
      // appBarTheme: AppBarTheme(
      //     foregroundColor: colorScheme.secondary,
      //     backgroundColor: colorScheme.primary,
      //     centerTitle: true,
      //     elevation: 0,
      //     iconTheme: IconThemeData(color: colorScheme.background),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(20),
      //         bottomRight: Radius.circular(20),
      //       ),
      //     ),
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: Colors.transparent,
      //     ),
      //     toolbarHeight: 70.0),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: secondaryColor,
        backgroundColor: primaryColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(secondaryColor),
          foregroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(color: secondaryColor, width: 2),
          ),
          backgroundColor: MaterialStateProperty.all(secondaryColor),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      cardTheme: CardTheme(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.grey.shade300),
      textTheme: _textTheme,
    );
  }
}





