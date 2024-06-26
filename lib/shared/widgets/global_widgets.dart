import 'package:flutter/material.dart';
import 'global_themes.dart';

class GlobalWidgets{
  static ThemeColors themeColors = ThemeColors();
  TextStyle textInputStyle = TextStyle(
    color: themeColors.lightGrey,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  TextStyle selectableTextStyle = TextStyle(
    color: themeColors.green,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  TextStyle buttonTextStyle = TextStyle(
    color: themeColors.white,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  TextStyle titleStyle = TextStyle(
    color: themeColors.black,
    fontSize: 30,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
}