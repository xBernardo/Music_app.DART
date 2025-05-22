import 'package:dropz_app/core/app/music_app_inicial_bindings.dart';
import 'package:dropz_app/core/app/music_app_material.dart';
import 'package:dropz_app/features/genre_list/presentation/screens/genre_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MusicAppMaterial.getTitle,
      theme: MusicAppMaterial.getTheme,
      getPages: MusicAppMaterial.getPages,
      initialRoute: GenreListScreen.routeName,
      initialBinding: MusicAppInitialBindinds(),
    );
  }
}