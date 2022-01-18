

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    color: HexColor('333739'),
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.teal,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.white
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.teal,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    elevation: 20,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.black),
  ),
);
