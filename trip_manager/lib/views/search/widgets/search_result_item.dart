import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/config/router/router_names.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/providers/selected_item.dart';
import '../../../models/search/filter_result.dart';

class SearchResultItem extends ConsumerWidget {
  final FilterResult item;

  SearchResultItem({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 18.0),
      dense: true,
      title: item.spaceType == SpaceType.region
          ? SearchFilterRegionItem(item: item)
          : SearchFilterItem(item: item),
      onTap: () {
        if (item.spaceType == SpaceType.region) {
        } else {
          ref.read(selectedItemProvider.notifier).setSelectedItem(item);
          context.pushNamed(RouteNames.placeDetail);
        }
      },
    );
  }
}

class SearchFilterItem extends StatelessWidget {
  const SearchFilterItem({
    super.key,
    required this.item,
  });

  final FilterResult item;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 4),
            Text(
              "서울",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.darkColor_3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SearchFilterRegionItem extends ConsumerWidget {
  const SearchFilterRegionItem({
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
      ],
    );
  }
}
