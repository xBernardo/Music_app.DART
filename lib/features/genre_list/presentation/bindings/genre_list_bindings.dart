import 'package:dropz_app/core/services/api_service.dart';
import 'package:dropz_app/features/genre_list/presentation/controllers/genre_list_controller.dart';
import 'package:dropz_app/features/genre_list/presentation/data/repositories/genre_list_repository.dart';
import 'package:get/get.dart';

class GenreListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GenreListController(
        GenreListRepository(apiService: Get.find<ApiService>()),
      ),
    );
  }
}
