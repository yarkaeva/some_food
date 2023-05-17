import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

MaterialColor mainGreen = const MaterialColor(0xFF447B72, {
  50: Color(0xFFe4f2f2),
  100: Color(0xFFbce0dd),
  200: Color(0xFF92cdc7),
  300: Color(0xFF6eb8b1),
  400: Color(0xFF5aa8a0),
  500: Color(0xFF50988f),
  600: Color(0xFF4a8b82),
  700: Color(0xFF447b72),
  800: Color(0xFF3f6b63),
  900: Color(0xFF364e48)
});

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: mainGreen,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fontFamily: GoogleFonts.roboto().fontFamily,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(),
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.comfortaa(
            fontSize: 30,
            color: mainGreen,
          ),
          bodyMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: const TextStyle(
            fontSize: 17,
            color: Color.fromARGB(207, 0, 0, 0),
            overflow: TextOverflow.clip,
          ),
        ),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Colors.red.shade400,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Colors.red.shade400,
            ),
          ),
          errorStyle: const TextStyle(fontSize: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: mainGreen),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Colors.black87),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(
              Size(190, 45),
            ),
            splashFactory: NoSplash.splashFactory,
            overlayColor: const MaterialStatePropertyAll(Colors.amber),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(fontSize: 16),
            ),
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(Size(190, 45)),
            splashFactory: NoSplash.splashFactory,
            overlayColor: const MaterialStatePropertyAll(Colors.amber),
            side: MaterialStatePropertyAll(BorderSide(
              width: 2,
              color: mainGreen,
            )),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 16,
              ),
            ),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.black87, size: 37),
          unselectedIconTheme: IconThemeData(color: Colors.black45, size: 35),
        ),
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.black87,
        ),
        toggleButtonsTheme: ToggleButtonsThemeData(
            textStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
            ),
            color: mainGreen,
            selectedColor: Colors.white,
            fillColor: mainGreen,
            borderColor: mainGreen,
            selectedBorderColor: mainGreen,
            borderWidth: 2,
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.transparent,
            constraints: const BoxConstraints(minWidth: 110, minHeight: 40)),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.red.shade400,
          elevation: 0,
          contentTextStyle: const TextStyle(fontSize: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
        ),
      );
}
