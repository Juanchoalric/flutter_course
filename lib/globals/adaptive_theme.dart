import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final ThemeData _androidTheme = ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.deepPurple,
            buttonColor: Colors.deepPurple);

final ThemeData _iOSTheme = ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.blueGrey,
            buttonColor: Colors.deepPurple,
            );

ThemeData getAdaptiveThemeData(context){
  return Theme.of(context).platform == TargetPlatform.android ? _androidTheme : _iOSTheme;
}