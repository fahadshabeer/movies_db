import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/models/theme_model.dart';

class AppColors {
  static final dark = ThemeData(
      colorScheme: ColorScheme.dark(
        primary: Colors.pinkAccent,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff191919),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Color(0xff191919),
      ));
  static final light = ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.pinkAccent,
    ),
    scaffoldBackgroundColor: Color(0xffececec),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );
}
