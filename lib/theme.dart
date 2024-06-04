import 'package:flutter/material.dart';

// final ThemeData themeData = ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//   useMaterial3: true,
// );
final ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 216, 216, 216),
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade300,
    inversePrimary: Colors.grey.shade800,
    onPrimary: Colors.deepPurple.shade100,
    onSecondary: Colors.deepPurple.shade200,
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
);

final ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 27, 27, 27),
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade800,
    tertiary: Colors.grey.shade900,
    inversePrimary: const Color.fromARGB(255, 241, 241, 241),
    onPrimary: Colors.deepPurple.shade400,
    onSecondary: Colors.deepPurple.shade300,
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
);
