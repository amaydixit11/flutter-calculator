// lib/src/app.dart

import 'package:project6m2/src/features/calculator/presentation/pages/calculator_screen.dart';
import 'package:project6m2/src/features/home/presentation/pages/home_screen.dart';
import 'features/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey[900]!,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey[900]!,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      headlineLarge: TextStyle(
          color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white70, fontSize: 18.0),
      titleSmall: TextStyle(color: Colors.white60, fontSize: 16.0),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.cyan[600]!,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800]!,
      labelStyle: TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan[600]!),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.cyan[600]!),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[600]!),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: Colors.cyan[600]!),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey[900]!,
      secondary: Colors.cyan[600]!,
    ).copyWith(background: Colors.grey[900]!),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          // DarkTheme.darkTheme,
          ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ChatScreen(),
      home: HomeScreen(),
      // home: CalculatorScreen(),
    );
  }
}
