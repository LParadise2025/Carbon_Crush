import 'package:flutter/material.dart';

// this class sets the style rules (such as color and default text size) for the app
class ThemeClass {
  static ThemeData getThemeData() {
    return ThemeData(

      // styles elevated buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[500], // Change button color to green
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
      // styles text
      textTheme: TextTheme(
        displayLarge: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black), // Customize headline1 style
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.green[700]), // Customize bodyText1 style
      ),
      // styles InputDecorationTheme (which can be applied to ther widgets)
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), 
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),

      // styles the dropdown menus 
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(color: Colors.green[700], fontSize: 16.0),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),

        // styles menus
        menuStyle: MenuStyle(
           backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 200, 230, 201)),
        
        ),
      ),

      // styles the app bar
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green[500], // Customize AppBar background color
        titleTextStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),

      // styles dividers
      dividerTheme: DividerThemeData(
        color: Colors.green[200],
        thickness: 1.0,
        space: 1,
      ),

      // styles progress indicators
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.green[500],
        linearTrackColor: Colors.green[100],
        linearMinHeight: 10.0,
        circularTrackColor: Colors.green[100],
        refreshBackgroundColor: Colors.green[500],
      ),
    );
  }
}
