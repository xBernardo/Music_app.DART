import 'package:dropz_app/core/app/music_app_colors.dart';
import 'package:flutter/material.dart';

class MusicAppTextStyle {
  static var getNormalBoldStyle;

  MusicAppTextStyle._();

  static TextStyle get getNormalStyle =>
     TextStyle(fontSize: 16, color: MusicAppColors.secondaryColor);

  static TextStyle get getBoldStyle =>
     getNormalStyle.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get getTitleStyle => 
    getNormalStyle.copyWith(fontSize: 24);

  static TextStyle get getSmalltype => getNormalStyle.copyWith(fontSize: 12);
}