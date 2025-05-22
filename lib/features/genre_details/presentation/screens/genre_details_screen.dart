import 'package:dropz_app/core/app/music_app_colors.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_models.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:dropz_app/shared/features/music_app/presentation/widgets/mini_music_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../../genre_list/presentation/widgets/genre_details_app_bar_widget.dart';
import '../../../genre_list/presentation/widgets/genre_details_music_list_widget.dart';

class GenreDetailsScreen extends StatelessWidget {
  static const routeName = "/genre-details";

  const GenreDetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    final genre = Get.arguments as GenreModels;

    return Scaffold(
      backgroundColor: MusicAppColors.primaryColor,
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  GenreDetailsAppBarWidget(genre: genre),
                  GenreDetailsMusicListWidget(
                    genreSearchString: genre.searchString,
                  ),
                ],
              ),
            ),
            if (musicPlayerController.getPlaylistPlaying.isNotEmpty)
              const MiniMusicPlayerWidget()
          ],
        )
      ),
    );
  }
}