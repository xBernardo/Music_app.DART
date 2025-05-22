import 'package:dartz/dartz.dart';
import 'package:dropz_app/core/errors/exceptions.dart';
import 'package:dropz_app/core/errors/feilures.dart';
import 'package:dropz_app/core/services/api_service.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_details_model.dart';

class GenreDetailsRepository {
  final ApiService _apiService;

  GenreDetailsRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<Either<Failure, GenreDetailsModel>> getGenreDetails(
    String genre) async {
      try{
        final GenreDetails = await _apiService.getGenreDetails(genre: genre);

        return Right(GenreDetails);
      } on ApiException catch (apiException) {
        return Left(GetGenreDetailsFailure(apiException.message));
      } on GeneralException catch (generalException) {
        return Left(GetGenreDetailsFailure(generalException.message));
      }
    }
}