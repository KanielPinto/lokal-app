// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokal_app_v1/pages/homepage/main_store.dart';
import 'package:lokal_app_v1/pages/splash/splash_page.dart';
import 'package:lokal_app_v1/pages/store/popular_store.dart';
import 'package:lokal_app_v1/routes/route_helper.dart';
import 'package:lokal_app_v1/auxiliary/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      //home: MainStore(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,

      //1.51 timestamp part 2
    );
  }
}
