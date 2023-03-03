import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lokal_app_v1/data/apis/api_client.dart';
import 'package:lokal_app_v1/data/repositories/popular_stores_repo.dart';

import '../controllers/popular_store_controller.dart';

Future<void> init() async {
  //api cLient
  Get.lazyPut(() => ApiClient(appBaseUrl: "appBaseUrl"));

  //repos
  Get.lazyPut(() => PopularStoresRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularStoreController(popularStoresRepo: Get.find()));
}

//5.47 timestamp