import 'package:get/route_manager.dart';
import 'package:lokal_app_v1/pages/homepage/main_store.dart';
import 'package:lokal_app_v1/pages/splash/splash_page.dart';
import 'package:lokal_app_v1/pages/store/popular_store.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = '/';
  static const String popularStore = "/popular-store";

  static String getPopularStore() => '$popularStore';
  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: "/", page: () => MainStore(), transition: Transition.native),
    GetPage(
        name: popularStore,
        page: () => PopularStore(),
        transition: Transition.rightToLeftWithFade),
  ];
}
