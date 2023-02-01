// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/utils/dimensions.dart';
import 'package:lokal_app_v1/widgets/subtitle_text.dart';

class IconPlusText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconPlusText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: 5,
        ),
        SubtitleText(
          text: text,
        ),
      ],
    );
  }
}
