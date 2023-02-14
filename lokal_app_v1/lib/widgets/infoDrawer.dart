import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/utils/colors.dart';
import 'package:lokal_app_v1/utils/dimensions.dart';
import 'package:lokal_app_v1/widgets/header_text.dart';
import 'package:lokal_app_v1/widgets/subtitle_text.dart';

import 'iconplustext.dart';

class InfoDrawer extends StatelessWidget {
  final String text;
  const InfoDrawer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(
          text: text,
          size: Dimensions.font26,
        ),
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
    );
  }
}
