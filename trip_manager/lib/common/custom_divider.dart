import 'package:flutter/material.dart';
import 'package:trip_manager/theme.dart';

class CustomDivider extends StatelessWidget {
  final Color color;

  const CustomDivider({
    Key? key,
    this.color = AppColors.lightColor_2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 좌우 공백을 없애기 위해 전체 너비 사용
      height: 1, // Divider처럼 보이도록 높이 설정
      color: color, // 원하는 색상
    );
  }
}
