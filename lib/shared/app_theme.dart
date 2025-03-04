import 'package:flutter/material.dart';

class AppTheme {
  static const Color Primary = Color.fromARGB(255, 65, 206, 37);
  static const Color black = Color(0xff303030);
  static const Color white = Color(0xffFFFFFF);
  static const Color nevy = Color(0xff4F5A69);
  static const Color red = Color(0xffC91C22);
  static const Color blue = Color(0xff003E90);
  static const Color pink = Color(0xffED1E79);
  static const Color brown = Color(0xffCF7E48);
  static const Color yellow = Color(0xffF2D352);
  static const Color babyblue = Color(0xff4882CF);

  static ThemeData lightmode = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 27, color: nevy),
          bodyLarge: TextStyle(fontSize: 22, color: white),
          titleSmall: TextStyle(fontSize: 14, color: nevy),
          bodySmall: TextStyle(
              fontSize: 14, color: black, fontWeight: FontWeight.w400)),
      appBarTheme: AppBarTheme(
        color: Primary,
        centerTitle: true,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ));

  static ThemeData darkmode = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 27, color: nevy),
          bodyLarge: TextStyle(fontSize: 22, color: white),
          titleSmall: TextStyle(fontSize: 14, color: nevy),
          bodySmall: TextStyle(
              fontSize: 14, color: black, fontWeight: FontWeight.w400)),
      appBarTheme: AppBarTheme(
        color: Primary,
        centerTitle: true,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ));
}
