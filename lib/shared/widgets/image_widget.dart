import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? img;
  //largura
  final double width;
  //Altura
  final double heigth;

  const ImageWidget({
    required this.heigth,
    required this.width,
    super.key,
    this.img,
  });
  
  @override
  Widget build(BuildContext context) {
    return img != null
        ? FadeInImage(
           placeholder: const AssetImage('assets/images/music_placeholder.png'),
           image: AssetImage(img!),
           fit: BoxFit.cover,
           width: width,
           height: heigth,
          )
        :Image.asset(
          'assets/images/music_placeholder.png',
          width: width,
          height: heigth,
          fit: BoxFit.cover,
        );
  }
}