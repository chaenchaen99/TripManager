import 'package:flutter/material.dart';
import 'package:trip_manager/theme.dart';

Widget text14Normal({
  String text = "",
  Color color = AppColors.darkColor_1,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget text16Normal({
  String text = "",
  Color color = AppColors.darkColor_1,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}
