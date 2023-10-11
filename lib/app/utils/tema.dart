import 'package:flutter/material.dart';

import 'text_style.dart';

abstract class CharacterTheme {
  static ThemeData get dark => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        iconTheme: IconThemeData(
            // color: AppColors.primaryColor,
            ),
        titleTextStyle: CharacterTextStyle.titleAppBar,
        elevation: 0,
      ),
      // scaffoldBackgroundColor: AppColors.primaryColor,
      // splashColor: AppColors.primaryColor,
      // hintColor: AppColors.primaryColor.withOpacity(0.4),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
      ));
}
