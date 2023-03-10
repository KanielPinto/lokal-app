// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/utils/colors.dart';
import 'package:lokal_app_v1/utils/dimensions.dart';

import 'bookmarks_page_body.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage("assets/image/local-white.png"),
                          height: 40,
                          width: 4 * 23.14,
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      backgroundColor: AppColors.mainColor, // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                    child: const Icon(Icons.person_outline_rounded,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: BookmarksPageBody(),
          )),
        ],
      ),
    );
  }
}
