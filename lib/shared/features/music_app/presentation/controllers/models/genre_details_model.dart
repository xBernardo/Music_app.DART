import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_models.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/music_model.dart';

class GenreDetailsModel extends GenreModels{
  //Lista de músicas do gênero
  final List<MusicModel> musics;

  GenreDetailsModel({
    required super.title,
    super.img,
    required this.musics,
    required super.searchString,
  });

  factory GenreDetailsModel.fromMap(Map<String, dynamic> map){
    return GenreDetailsModel(
      title: map['title'] ?? '',
      musics: (map['musics'] as List)
        .map((music) => MusicModel.fromMap(music))
        .toList(),
      searchString: map['searchString'] ?? '',
      img: map['img'] ?? '',
      );
  }
}