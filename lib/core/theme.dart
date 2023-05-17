import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainGreen = Color.fromRGBO(68, 123, 114, 1);

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: mainGreen),
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
            backgroundColor: const MaterialStatePropertyAll(
              mainGreen,
            ),
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
            side: const MaterialStatePropertyAll(BorderSide(
              width: 2,
              color: mainGreen,
            )),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 16,
              ),
            ),
            foregroundColor: const MaterialStatePropertyAll(
              mainGreen,
            ),
            elevation: const MaterialStatePropertyAll(0),
            // fixedSize: const MaterialStatePropertyAll(Size(180, 52)),
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
      );
}
