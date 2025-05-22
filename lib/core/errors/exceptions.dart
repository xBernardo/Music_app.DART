class ApiException implements Exception {
  final String message;
  final int? statuscode;

  ApiException({
    required this.message,
    this.statuscode,
  });

}


class GeneralException implements Exception{
  final String message;

  GeneralException({
    this.message = "Um erro foi encontrado, tente novamente",
  });
}


class AudioPlayerException implements Exception {
  final String message;

  AudioPlayerException({required this.message});
}