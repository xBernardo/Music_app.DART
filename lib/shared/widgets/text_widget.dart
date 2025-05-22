import 'package:dropz_app/core/app/music_app_text_style.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TextWidget(
    this.text, {
    this.style,
    this.textAlign,
    super.key,
  });
  
  TextWidget.bold(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    }
  ) : style = textStyle ?? MusicAppTextStyle.getNormalBoldStyle;

    TextWidget.title(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    }
  ) : style = textStyle ?? MusicAppTextStyle.getTitleStyle;

    TextWidget.normal(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    }
  ) : style = textStyle ?? MusicAppTextStyle.getNormalStyle;

    TextWidget.small(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    }
  ) : style = textStyle ?? MusicAppTextStyle.getSmalltype;

  

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}