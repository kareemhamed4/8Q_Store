import 'package:flutter/material.dart';
import 'package:q8_store/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: myFavColor,
  scaffoldBackgroundColor: myFavColor5,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor),
    bodyText2: TextStyle(fontFamily: "Inter-Regular",color: myFavColor),
    subtitle1: TextStyle(fontFamily: "Inter-Medium",color: myFavColor),
    subtitle2: TextStyle(fontFamily: "Almarai-Regular",color: myFavColor),
    headline5: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor),
    headline6: TextStyle(fontFamily: "Almarai-Bold",color: myFavColor4),
    caption: TextStyle(fontFamily: "Rubik-Light",color: myFavColor2),
    button: const TextStyle(fontFamily: "Almarai-Bold",color: Colors.white,fontSize: 16),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: myFavColor5,
    elevation: 5,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: myFavColor,
    unselectedItemColor: myFavColor4,
    selectedLabelStyle: TextStyle(color: myFavColor, fontFamily: "Almarai-Bold",fontSize: 10),
    unselectedLabelStyle: TextStyle(color: myFavColor4, fontFamily: "Almarai-Regular",fontSize: 10),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: myFavColor5,
    iconTheme: IconThemeData(
      color: myFavColor,
    )
  ),
);