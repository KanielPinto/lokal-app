import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SubtitleText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;

  SubtitleText({
    Key? key,
    this.color = const Color.fromARGB(255, 155, 161, 161),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'LeagueSpartan',
        color: color,
        fontSize: size,
      ),
    );
  }
}
