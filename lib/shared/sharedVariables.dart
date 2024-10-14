import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

String? USEREMAIL, USERNAME, USERTOKEN;
ThemeData themeData = ThemeData(
    secondaryHeaderColor: const Color(0xFF02b4ea),
    fontFamily: "roboto2",
    primaryColor: const Color.fromARGB(255, 24, 68, 139),
    textTheme: TextTheme(
      displayMedium: const TextStyle(color: Color(0xFF02b4ea), fontSize: 18),
      bodyLarge: const TextStyle(
          fontSize: 34, color: Colors.white, fontWeight: FontWeight.w500),
      displayLarge: const TextStyle(
          fontSize: 34, color: Colors.black, fontWeight: FontWeight.w500),
      labelLarge: const TextStyle(color: Colors.black, fontSize: 16),
      labelMedium: TextStyle(color: Colors.grey.shade600, fontSize: 14),
      titleMedium: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 24, 68, 139),
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyMedium: const TextStyle(color: Colors.white, fontSize: 16),
      titleSmall: const TextStyle(fontSize: 10),
      headlineLarge: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      headlineMedium: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    ));
