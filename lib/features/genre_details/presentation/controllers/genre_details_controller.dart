import 'package:dropz_app/core/errors/feilures.dart';
import 'package:dropz_app/core/mixins/screen_loading_and_error_mixin.dart';
import 'package:dropz_app/features/genre_details/data/repositories/genre_details_repository.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_details_model.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_models.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/music_model.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:get/get.dart';

class GenreDetailsController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreDetailsRepository _genreDetailsRepository;
  final MusicPlayerController _musicPlayerController;

  GenreDetailsController(
    GenreDetailsRepository genreDetailsRepository,
    MusicPlayerController musicPlayerController,
  ) : _genreDetailsRepository = genreDetailsRepository,
      _musicPlayerController = musicPlayerController;

  GenreDetailsModel? genreDetails;

  @override
  void onInit() {
    final genre = Get.arguments as GenreModels;

    loadGenreDetails(genre.searchString);

    super.onInit();
  }

  Future<void> loadGenreDetails(String genre) async {
    setLoadingToTrue();
    setError(null);

    final genreDetailsResponseEither = await _genreDetailsRepository.getGenreDetails(genre);

    genreDetailsResponseEither.fold((Failure failureResponse) {
      if (failureResponse is GetGenreDetailsFailure) {
        setError(failureResponse.message);
      }
    }, (GenreDetailsModel genreDetailsResponse) {
      genreDetails = genreDetailsResponse;

      // Carrega a selected playlist do music player controller
      _musicPlayerController.loadPlaylist(
        genreDetailsResponse.musics, _musicPlayerController.selectPlaylist);
    
    });

    setLoadingToFalse();
  }

  MusicModel? getMusicByIndex(int index) => genreDetails?.musics[index];

  List<MusicModel>?  get getMusic => genreDetails?.musics;







  // ignore: prefer_typing_uninitialized_variables
  var genres;

  @override
  // ignore: prefer_typing_uninitialized_variables
  var getError;

  Future<void> getGenreList() async {
    // lógica de buscar os gêneros
  }
}
