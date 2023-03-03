// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/pages/homepage/main_store.dart';
import 'package:lokal_app_v1/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  List pages = [
    Container(
      child: Center(child: Text("bookmarks page")),
    ),
    MainStore(),
    Container(
      child: Center(child: Text("search page")),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.pinkColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 20,
          onTap: onTapNav,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks_outlined), label: "Bookmarks"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search"),
          ]),
    );
  }
}
