import 'package:flutter/material.dart';

import '../../../theme.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 4.0,
        ),
        CircleNumber(
          number: number,
        ),
        const SizedBox(height: 4),
        Container(
          width: 1,
          height: 40,
          color: const Color(0x20183347),
        ),
      ],
    );
  }
}

class CircleNumber extends StatelessWidget {
  final int number;
  final double size;
  final Color backgroundColor;
  final Color textColor;

  const CircleNumber({
    Key? key,
    required this.number,
    this.size = 20.0,
    this.backgroundColor = AppColors.mainColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
