import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/state_manager.dart';
import 'package:lokal_app_v1/data/apis/api_client.dart';

class PopularStoresRepo extends GetxService {
  final ApiClient apiClient;
  PopularStoresRepo({required this.apiClient});

  Future<Response> getPopularStoresList() async {
    return await apiClient.getData("end point url");
  }
}
