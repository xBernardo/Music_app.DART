import 'package:dropz_app/core/errors/feilures.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_models.dart';
import 'package:get/get.dart';

import '../../../../core/mixins/screen_loading_and_error_mixin.dart';
import '../data/repositories/genre_list_repository.dart';

class GenreListController extends GetxController 
  with ScreenLoadingAndErrorMixin {
    final GenreListRepository _genreListRepository;    


    GenreListController(GenreListRepository genreListRepository)
     : _genreListRepository = genreListRepository;


    final RxList<GenreModels> genres = RxList([]);

    @override
    void onInit(){
      getGenreList();
      super.onInit();
    }

    Future<void> getGenreList() async {
      setLoadingToTrue();
      setError(null);

      final getGenresResponse = await _genreListRepository.getGenteList();

      getGenresResponse.fold((Failure failureResponse){
        if(failureResponse is GetGenreListFailure){
          setError(failureResponse.message);
        }
      }, (List<GenreModels> genreResponse){
        genres.value = genreResponse;
      });


      setLoadingToFalse();
    }
}