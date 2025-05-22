import 'package:dropz_app/core/errors/exceptions.dart';
import 'package:dropz_app/core/services/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_models.dart';

import '../../../../../core/errors/feilures.dart';



class GenreListRepository {
  final ApiService _apiService;

  GenreListRepository({required ApiService apiService}) : _apiService = apiService;

  Future<Either<Failure, List<GenreModels>>>  getGenteList() async {
    try{
      final genres = await _apiService.getGenres();

      return Right(genres);
    } on ApiException catch (ApiException) {
      return left(GetGenreListFailure(ApiException.message));
    } on GeneralException catch (generalException) {
      return Left(GetGenreListFailure(generalException.message));
    }
  }
}