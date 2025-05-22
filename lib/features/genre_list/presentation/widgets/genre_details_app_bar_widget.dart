import 'package:dropz_app/core/extensions/media_query_extension.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_models.dart';
import 'package:dropz_app/shared/widgets/image_widget.dart';
import 'package:dropz_app/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class GenreDetailsAppBarWidget extends StatelessWidget {
  final GenreModels genre;

  const GenreDetailsAppBarWidget({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.getWidth / 1.5,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: context.getWidth / 3 - 12),
        title: TextWidget.title(genre.title),
        stretchModes: const[
          StretchMode.zoomBackground,
          StretchMode.fadeTitle
        ],
        background: Hero(
          tag: genre.title,
          child: ImageWidget(
            width: context.getWidth,
            heigth: context.getWidth / 1.5,
            img: genre.img,
          ),
        ),
      ),
    );
  }
}
