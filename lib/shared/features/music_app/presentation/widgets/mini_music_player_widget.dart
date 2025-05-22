import 'package:dropz_app/core/app/music_app_colors.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:dropz_app/shared/widgets/image_widget.dart';
import 'package:dropz_app/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/music_player_controls/widgets/play_pause_button_widget.dart';

class MiniMusicPlayerWidget extends StatelessWidget {
  const MiniMusicPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final musicPlayeController = Get.find<MusicPlayerController>();

    return GestureDetector(
      onTap: () => musicPlayeController.showMusicPlayer(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MusicAppColors.primaryColor,
              // ignore: deprecated_member_use
              MusicAppColors.tertiaryColor.withOpacity(0.5),
            ],
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 8,
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ImageWidget(
                            heigth: 50,
                            width: 50,
                            img: musicPlayeController.getCurrentPlayingMusic?.img,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextWidget.normal(
                              musicPlayeController
                                      .getCurrentPlayingMusic
                                      ?.title ??
                                  'Música',
                            ),
                          ),
                        ],
                      ),
                    ),
                    PlayPauseButtonWidget(
                      musicUrl: musicPlayeController.getCurrentPlayingMusic?.url,
                      playPauseButtonSize: PlayPauseButtonSize.small,
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: musicPlayeController.getCurrentPositionStream,
              builder: (_, AsyncSnapshot<Duration> snapshot) {
                final currentPositionSeconds =
                    snapshot.data?.inSeconds ??
                    musicPlayeController.currentMusicDuration.value;

                return LinearProgressIndicator(
                  value: (currentPositionSeconds /
                          (musicPlayeController
                                  .getCurrentPlayingMusic
                                  ?.duration ??
                              0))
                      .clamp(0, 1),
                backgroundColor: Colors.grey.shade600,
                valueColor: AlwaysStoppedAnimation<Color>(
                  MusicAppColors.secondaryColor,
                ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
