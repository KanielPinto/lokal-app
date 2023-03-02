import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/state_manager.dart';
import 'package:lokal_app_v1/data/repositories/popular_stores_repo.dart';

class PopularStoreController extends GetxController {
  final PopularStoresRepo popularStoresRepo;
  PopularStoreController({required this.popularStoresRepo});
  List<dynamic> _popularStoresList = [];
  List<dynamic> get popularStoresList => _popularStoresList;
  Future<void> getPopularStoresList() async {
    Response response = await popularStoresRepo.getPopularStoresList();

    if (response.statusCode == 200) {
      _popularStoresList = [];
      //_popularStoresList.addAll();
      update();
    } else {}
  }
}
