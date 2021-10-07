import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const FlexSchemeData _customFlexScheme = FlexSchemeData(
  name: 'Toledo purple',
  description: 'Purple theme created from custom defined colors.',
  light: FlexSchemeColor(
    primary: Colors.blue,
    primaryVariant: Colors.blueAccent,
    secondary: Colors.lightBlue,
    secondaryVariant: Colors.lightBlueAccent,
  ),
  dark: FlexSchemeColor(
    primary: Colors.blue,
    primaryVariant: Colors.blueAccent,
    secondary: Colors.lightBlue,
    secondaryVariant: Colors.lightBlueAccent,
  ),
);

ThemeData appThemeLight() => FlexColorScheme.light(
      colors: _customFlexScheme.light,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    ).toTheme;

ThemeData appThemeDark() => FlexColorScheme.dark(
      colors: _customFlexScheme.dark,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    ).toTheme;
