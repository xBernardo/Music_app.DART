import 'package:dropz_app/core/app/music_app_colors.dart';
import 'package:dropz_app/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ButtonWidget({
    required this.title,
    required this.onPressed,
    super.key,
    });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MusicAppColors.tertiaryColor,
      ),
      child: TextWidget.bold(title),
    );
  }
}