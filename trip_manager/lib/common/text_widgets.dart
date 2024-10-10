import 'package:flutter/material.dart';
import 'package:trip_manager/theme.dart';

Widget text12Normal({
  String text = "",
  FontWeight weight = FontWeight.w400,
  Color color = AppColors.darkColor_1,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 12,
      fontWeight: weight,
    ),
  );
}

Widget text14Normal({
  String text = "",
  Color color = AppColors.darkColor_1,
  FontWeight weight = FontWeight.w400,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: weight,
    ),
  );
}

Widget text16Normal(
    {String text = "",
    Color color = AppColors.darkColor_1,
    FontWeight weight = FontWeight.w400}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: weight,
    ),
  );
}

Widget text20Bold({
  String text = "",
  Color color = AppColors.darkColor_1,
  FontWeight weight = FontWeight.w600,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: weight,
    ),
  );
}
