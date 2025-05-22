import 'package:dropz_app/core/app/music_app_colors.dart';
import 'package:dropz_app/core/app/music_app_text_style.dart';
import 'package:dropz_app/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'image_widget.dart';

class ImgAndTitleRowWidget extends StatelessWidget {
  final String? heroTag;
  final String? img;
  final String title;
  final Color? titlecolor;

  const ImgAndTitleRowWidget({
    this.heroTag,
    this.img,
    required this.title,
    this.titlecolor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: heroTag ?? '',
          child: ImageWidget(img: img, width: 80, heigth: 80),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextWidget.normal(
            title,
            textStyle: MusicAppTextStyle.getNormalStyle.copyWith(
              color: titlecolor ?? MusicAppColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
