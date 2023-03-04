import 'package:get/route_manager.dart';
import 'package:lokal_app_v1/pages/bookmarks/bookmarks_page.dart';
import 'package:lokal_app_v1/pages/homepage/home_page.dart';
import 'package:lokal_app_v1/pages/homepage/main_store.dart';
import 'package:lokal_app_v1/pages/splash/splash_page.dart';
import 'package:lokal_app_v1/pages/store/popular_store.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = '/';
  static const String popularStore = "/popular-store";
  static const String bookmarksPage = "/bookmarks-page";

  static String getPopularStore() => popularStore;
  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getBookmarksPage() => bookmarksPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(
      name: "/",
      transition: Transition.leftToRight,
      page: () => const HomePage(),
    ),
    GetPage(
      name: popularStore,
      transition: Transition.rightToLeftWithFade,
      page: () => const PopularStore(),
    ),
    GetPage(
      name: bookmarksPage,
      transition: Transition.leftToRight,
      page: () => const BookmarksPage(),
    ),
  ];
}
