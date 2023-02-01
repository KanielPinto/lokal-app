// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/utils/colors.dart';
import 'package:lokal_app_v1/utils/dimensions.dart';
import 'package:lokal_app_v1/widgets/header_text.dart';
import 'package:lokal_app_v1/widgets/iconplustext.dart';
import 'package:lokal_app_v1/widgets/subtitle_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;
  double scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
            //color: Colors.redAccent,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                })),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: currentPageValue,
          decorator: DotsDecorator(activeColor: AppColors.mainColor),
        ),

        //Popular text
        SizedBox(
          height: Dimensions.height30,
        ),

        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              HeaderText(
                text: "Popular",
                size: Dimensions.font20 * 1.15,
                color: AppColors.mainColor,
              )
            ],
          ),
        ),

        //list of food and dishes
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //image container
                    Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/food0.png"),
                          ),
                        )),

                    //text container
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTxtContainerSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeaderText(text: "Name of Shop 1"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SubtitleText(text: "1 Line Description of shop"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconPlusText(
                                      icon: Icons.circle_sharp,
                                      text: "Category",
                                      iconColor: AppColors.iconColor1),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  IconPlusText(
                                      icon: Icons.location_on,
                                      text: "Location",
                                      iconColor: AppColors.mainColor),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  IconPlusText(
                                      icon: Icons.delivery_dining_outlined,
                                      text: "",
                                      iconColor: AppColors.iconColor2)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

        SizedBox(
          height: Dimensions.height45,
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPageValue.floor()) {
      var currentScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currentScale =
          scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(1, currentTrans, 1);
    } else if (index == currentPageValue.floor() - 1) {
      var currentScale = 1 - (currentPageValue - index) * (1 - scaleFactor);

      var currentTrans = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1);

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - currentScale) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          SizedBox(
            height: Dimensions.height20,
          ),
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food0.png"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(text: "Featured Store"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: [
                            ...List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 15,
                                    )),
                          ],
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SubtitleText(text: "4.5"),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        //   SubtitleText(text: "1287"),
                        //   SizedBox(
                        //     width: Dimensions.width10,
                        //   ),
                        //   SubtitleText(text: "comments"),
                        //
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconPlusText(
                            icon: Icons.circle_sharp,
                            text: "Category",
                            iconColor: AppColors.iconColor1),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        IconPlusText(
                            icon: Icons.location_on,
                            text: "Location",
                            iconColor: AppColors.mainColor),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        IconPlusText(
                            icon: Icons.delivery_dining_outlined,
                            text: "Delivery",
                            iconColor: AppColors.iconColor2)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
