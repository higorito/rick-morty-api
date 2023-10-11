import 'package:flutter/material.dart';

//part é pra proteger o esquema de cores de alterações pq de la estava privado
part 'color_schemes.g.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  fontFamily: 'Poppins',
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  fontFamily: 'Poppins',
  // fontFamily: 'Onest',
);
