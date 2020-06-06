import 'package:flutter/material.dart';

final appTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  primaryColor: Colors.green[800],
  accentColor: Colors.green[600],
  fontFamily: 'Roboto',
);

final matchDateTextStyle = TextStyle(
  inherit: true,
  fontSize: 14,
);

final matchTimeTextStyle = TextStyle(
  inherit: true,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

final scoreTextStyle = TextStyle(
  inherit: true,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
