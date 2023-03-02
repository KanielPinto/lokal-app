import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lokal_app_v1/utils/colors.dart';
import 'package:lokal_app_v1/utils/dimensions.dart';
import 'package:lokal_app_v1/widgets/subtitle_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SubtitleText(text: firstHalf)
          : Column(children: [
              SubtitleText(
                text:
                    hiddenText ? ("$firstHalf....") : (firstHalf + secondHalf),
                size: Dimensions.font16,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Row(children: [
                  SubtitleText(
                    text: hiddenText ? ("See More") : ("See Less"),
                    color: AppColors.mainColor,
                    size: Dimensions.font16,
                  ),
                  Icon(
                    hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    color: AppColors.mainColor,
                  ),
                ]),
              )
            ]),
    );
  }
}
