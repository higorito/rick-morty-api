import 'package:flutter/material.dart';

abstract class CharacterTextStyle {
  static const characterName = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 62, 61, 129),
  );

  static const characterStatus = TextStyle(
    fontSize: 14.0,
    color: Color.fromARGB(255, 62, 61, 129),
  );

  static const characterNameDetail = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: Color.fromARGB(255, 62, 61, 129),
  );

  static const informationTitleRow = TextStyle(
    fontSize: 18.0,
    color: Color.fromARGB(255, 62, 61, 129),
  );

  static const informationTextRow = TextStyle(
    fontSize: 18.0,
    color: Color.fromARGB(255, 62, 61, 129),
  );

  static const titleAppBar = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
}
