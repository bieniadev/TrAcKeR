import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 219, 219, 219),
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade300,
    inversePrimary: const Color.fromARGB(255, 80, 79, 79),
    onPrimary: Colors.green.shade500,
    onSecondary: Colors.green.shade400,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.chevron_left_rounded,
          color: Colors.grey.shade800,
          size: 28,
        )),
    drawerButtonIconBuilder: (context) => IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Icons.menu_rounded,
          color: Colors.grey.shade800,
          size: 28,
        )),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: Colors.green.shade500,
    textStyle: GoogleFonts.josefinSans(color: Colors.green.shade400, fontSize: 20),
  )),
);

final ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 27, 27, 27),
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade800,
    tertiary: Colors.grey.shade900,
    inversePrimary: const Color.fromARGB(255, 241, 241, 241),
    onPrimary: Colors.green.shade200,
    onSecondary: Colors.green.shade300,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.chevron_left_rounded,
          color: Color.fromARGB(255, 241, 241, 241),
          size: 28,
        )),
    drawerButtonIconBuilder: (context) => IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(
          Icons.menu_rounded,
          color: Color.fromARGB(255, 241, 241, 241),
          size: 28,
        )),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: Colors.green.shade200,
    textStyle: GoogleFonts.josefinSans(color: Colors.green.shade300, fontSize: 20),
  )),
);
