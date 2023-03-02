// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/utils/colors.dart';
import 'package:lokal_app_v1/utils/dimensions.dart';
import 'package:lokal_app_v1/widgets/app_icon.dart';
import 'package:lokal_app_v1/widgets/expandable_text.dart';
import 'package:lokal_app_v1/widgets/header_text.dart';
import 'package:lokal_app_v1/widgets/iconplustext.dart';
import 'package:lokal_app_v1/widgets/infoDrawer.dart';
import 'package:lokal_app_v1/widgets/subtitle_text.dart';

class PopularStore extends StatelessWidget {
  const PopularStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularStoreImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/store0.jpg"))),
              )),
          //Store Blip
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_rounded),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          //Store Info
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularStoreImgSize - 20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoDrawer(
                    text: "Featured Store",
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  HeaderText(text: "Store Info"),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                          text:
                              " Sparkle & Shine Bracelets is a small business that was founded with the intention of creating unique and stylish bracelets that make women feel confident and empowered. Jane, the founder of Sparkle & Shine Bracelets, is a passionate jewelry maker who has always had a love for designing beautiful pieces. \n\n Jane's journey as a jewelry maker began when she was young, making friendship bracelets for her friends and family. As she grew older, her passion for creating jewelry grew as well, and she began experimenting with different materials and techniques to perfect her craft. After years of honing her skills, she decided to turn her hobby into a business, and Sparkle & Shine Bracelets was born. \n\n Every bracelet that Sparkle & Shine Bracelets creates is carefully crafted with attention to detail, using only the highest quality materials. Jane sources her materials from all over the world, including semi-precious stones, beads, and charms. She ensures that every piece she creates is not only beautiful but also durable and long-lasting. \n\n Sparkle & Shine Bracelets offers a wide range of styles, from elegant and sophisticated to bohemian and casual. Jane designs each bracelet with the intention of creating a unique piece that will complement any outfit and make the wearer feel confident and stylish. Each piece is handmade with love, care, and attention to detail, ensuring that no two bracelets are alike. \n\n Jane's mission is to create beautiful, affordable bracelets that make women feel confident and empowered. She believes that a great piece of jewelry can make all the difference in a person's day, and her goal is to provide her customers with pieces that they will love and cherish for years to come. \n\n Whether you're looking for a special gift for someone you love or just want to treat yourself to something special, Sparkle & Shine Bracelets has something for everyone. From classic and timeless styles to trendy and modern pieces, there's a bracelet to suit every taste and occasion. With Sparkle & Shine Bracelets, you can be confident that you're getting a unique, high-quality piece of jewelry that will bring a touch of sparkle and shine to your life"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.pinkColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.bookmark_add_outlined),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  HeaderText(
                    text: "Bookmark",
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: HeaderText(
                text: 'Contact Now',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
