import 'package:dropz_app/features/genre_details/presentation/controllers/genre_details_controller.dart';
import 'package:dropz_app/features/genre_details/presentation/screens/genre_details_screen.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:dropz_app/shared/features/music_app/presentation/widgets/mini_music_player_widget.dart';
import 'package:dropz_app/shared/widgets/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../../../shared/widgets/img_and_title_row_Widget.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = "/genre-list";
  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genreListCtrl = Get.find<GenreDetailsController>();
    final musicPlayerCtrl = Get.find<MusicPlayerController>();

    return Obx(
      () => ScreenWidget(
        isLoading: genreListCtrl.getIsLoading,
        title: 'Lista de Gêneros',
        error: genreListCtrl.getError,
        onTryAgain: () => genreListCtrl.getGenreList(),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemBuilder: (_, int index) {
                    final genre = genreListCtrl.genres[index];
                    return InkWell(
                      onTap:
                          () => Get.toNamed(
                            '${GenreListScreen.routeName}${GenreDetailsScreen.routeName}',
                            arguments: genre,
                          ),
                      child: ImgAndTitleRowWidget(
                        title: genre.title,
                        heroTag: genre.title,
                        img: genre.img,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 12);
                  },
                  itemCount: genreListCtrl.genres.length,
                ),
              ),
            ),
            if (musicPlayerCtrl.getPlaylistPlaying.isNotEmpty)
              const MiniMusicPlayerWidget(),
          ],
        ),
      ),
    );
  }
}
