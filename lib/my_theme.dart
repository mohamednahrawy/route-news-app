import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color lightBlackColor = Color(0xff303030);
  static const Color blackColor = Color(0xff000000);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)))),
  );
}
