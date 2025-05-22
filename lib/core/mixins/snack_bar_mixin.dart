import 'package:dropz_app/core/app/music_app_colors.dart';
import 'package:get/get.dart';

mixin SnackBarMixin {
  void showErrorSnackBar(String descreption) {
    Get.snackbar(
      "Erro",
      descreption,
      colorText: MusicAppColors.secondaryColor,
      backgroundColor: MusicAppColors.errorColor,
    );
  }
}