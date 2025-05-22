class MusicModel {
    //Imagens do genero músical
  final String? img;
  //Titulo do genero músical
  final String title;
  // O caminho onde a música está
  final String url;
  // Duração da música
  final int duration;


  MusicModel({
    this.img,
    required this.title,
    required this.url,
    required this.duration,
  });

  factory MusicModel.fromMap(Map<String, dynamic> map)  {
    return MusicModel(
      img: map['img'],
      title: map['title'] ?? '',
      url: map['path'] ?? '',
      duration: map['duration'] ?? 0,
    );
  }
}