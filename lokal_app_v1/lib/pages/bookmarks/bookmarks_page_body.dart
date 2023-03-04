import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/header_text.dart';
import '../../widgets/iconplustext.dart';
import '../../widgets/subtitle_text.dart';

class BookmarksPageBody extends StatefulWidget {
  const BookmarksPageBody({super.key});

  @override
  State<BookmarksPageBody> createState() => _BookmarksPageBodyState();
}

class _BookmarksPageBodyState extends State<BookmarksPageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin:
            EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width10),
        child: Row(
          children: [
            HeaderText(
              text: "Bookmarked Stores",
              size: Dimensions.font20 * 1.15,
              color: AppColors.yellowColor,
            )
          ],
        ),
      ),
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getPopularStore());
              },
              child: Container(
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
                            image: AssetImage("assets/image/store0.jpg"),
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
                              HeaderText(text: "Name of Shop"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SubtitleText(text: "Description of Shop"),
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
              ),
            );
          }),
    ]);
  }
}
