import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lokal_app_v1/data/apis/api_client.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: "appBaseUrl"));
}

//5.47 timestamp