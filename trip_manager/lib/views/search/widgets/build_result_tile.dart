import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/providers/search_history.dart';

import '../../../models/search/filter_result.dart';

class BuildResultTile extends ConsumerWidget {
  final FilterResult item;

  BuildResultTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 18.0),
      dense: true,
      title: item.spaceType == SpaceType.region
          ? RegionItem(item: item)
          : Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8), // roundRadius 적용
                  child: Container(
                    width: 56.w,
                    height: 56.h,
                    color: AppColors.lightColor_2, // URL이 빈 문자열일 때 회색 배경 적용
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "서울",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.darkColor_3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      onTap: () {},
    );
  }
}

class RegionItem extends ConsumerWidget {
  const RegionItem({
    super.key,
    required this.item,
  });

  final FilterResult item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          width: 36.0, // 원형 위젯의 너비
          height: 36.0, // 원형 위젯의 높이
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.lightColor_2), // 테두리 색상
          ),
          child: ClipOval(
            child: Center(
              child: Image.asset(
                'assets/icons/location_empty.png', // 위치 아이콘 경로
                width: 20.w, // 아이콘의 너비
                height: 20.h, // 아이콘의 높이
                fit: BoxFit.contain, // 아이콘 크기 조정 방식
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(width: 4),
            Text(
              "1255",
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.darkColor_3,
              ),
            ),
          ]),
          Text(
            "서울",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.darkColor_3,
            ),
          ),
        ]),
        Spacer(),
        GestureDetector(
          onTap: () {
            ref
                .read(searchHistoryProvider.notifier)
                .clearSearchHistory(item.name);
          },
          child: Container(
            padding: EdgeInsets.all(9),
            child: Image.asset(
              'assets/icons/close.png',
              width: 11,
              height: 11,
            ),
          ),
        ),
      ],
    );
  }
}
