// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/pages/bookmarks/bookmarks_page.dart';
import 'package:lokal_app_v1/pages/homepage/main_store.dart';
import 'package:lokal_app_v1/pages/search/search.dart';
import 'package:lokal_app_v1/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  late PersistentTabController _controller;

  List pages = [
    const BookmarksPage(),
    const MainStore(),
    Container(
      child: const Center(child: Text("search page")),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
  }

  List<Widget> _buildScreens() {
    return [
      const BookmarksPage(),
      const MainStore(),
      const Search(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bookmarks_outlined),
        title: ("Bookmarks"),
        activeColorPrimary: AppColors.pinkColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_rounded),
        title: ("Home"),
        activeColorPrimary: AppColors.pinkColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: AppColors.pinkColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xFF303030), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 300),
      ),
      navBarStyle:
          NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_currentIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //         currentIndex: _currentIndex,
  //         selectedItemColor: AppColors.pinkColor,
  //         showSelectedLabels: true,
  //         showUnselectedLabels: false,
  //         elevation: 20,
  //         onTap: onTapNav,
  //         items: [
  //           const BottomNavigationBarItem(
  //               icon: Icon(Icons.bookmarks_outlined), label: "Bookmarks"),
  //           const BottomNavigationBarItem(
  //               icon: Icon(Icons.home_rounded), label: "Home"),
  //           const BottomNavigationBarItem(
  //               icon: Icon(Icons.search), label: "Search"),
  //         ]),
  //   );
  // }
}
