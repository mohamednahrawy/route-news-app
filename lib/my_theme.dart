import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color lightBlackColor = Color(0xff303030);
  static const Color blackColor = Color(0xff000000);
  static const Color redColor = Color(0xffC91C22);
  static const Color darkBlueColor = Color(0xff003E90);
  static const Color pinkColor = Color(0xffED1E79);
  static const Color brownColor = Color(0xffCF7E48);
  static const Color blueColor = Color(0xff4882CF);
  static const Color yellowColor = Color(0xffF2D352);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
          color: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)))),
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
}
