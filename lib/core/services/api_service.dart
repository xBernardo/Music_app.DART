import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_details_model.dart';
import 'package:dropz_app/shared/features/music_app/presentation/controllers/models/genre_models.dart';

import '../errors/exceptions.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModels>> getGenres() async {
    try {
      const endPoint = "/genres";

      final response = await get(endPoint);

      return (response.data as List)
        .map((genre) => GenreModels.fromMap(genre))
        .toList();
    } on DioException catch (dioError, stackTrace) {
      log(
        "Erro ao fazer o get dos erros musicais",
        error: dioError,
        stackTrace: stackTrace,
      );
      throw ApiException(
        message: "Erro ao carregar gêneros",
        statuscode: dioError. response?.statusCode
      );
    } catch(error, stackTrace){
      log(
        "Erro ao fazer o get dos gêneros musicais",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = "/genres/$genre";

      final response = await get(endPoint);

      return GenreDetailsModel.fromMap(response.data);
    } on DioException catch (dioError, stackTrace) {
      log(
        "Erro ao fazer o get dos detalhes do genero musical",
        error: dioError,
        stackTrace: stackTrace,
      );
      throw ApiException(
        message: "Erro ao fazer o get dos detalhes do genero musical.",
        statuscode: dioError. response?.statusCode
      );
    } catch(error, stackTrace){
      log(
        "Erro ao fazer o get dos detalhes do genero musical.",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }
}