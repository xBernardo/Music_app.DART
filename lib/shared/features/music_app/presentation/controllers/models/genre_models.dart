class GenreModels {
  //Imagens do genero músical
  final String? img;
  //Titulo do genero músical
  final String title;
  // Nome do gênero onde vai consumir a API de pegar os detalhes
  final String searchString;

  GenreModels({
    this.img,
    required this.title,
    required this.searchString,
  });

  factory GenreModels.fromMap(Map<String, dynamic> map ){
    return GenreModels(
      img: map['img'],
      title: map['title'] ?? '',
      searchString: map['searchString'] ?? '',
    );
  }
}