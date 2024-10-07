import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_manager/shared/custom_divider.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/widgets/build_result_tile.dart';
import '../../../models/search/filter_result.dart';

Widget buildFilteredResultsView(List<FilterResult> results, isAllSection) {
  final Map<SpaceType, List<FilterResult>> groupedResults = {
    SpaceType.region: [],
    SpaceType.restaurant: [],
    SpaceType.cafe: [],
    SpaceType.space: [],
  };

  // Populate the map with results, limiting each category to 5 items
  for (var item in results) {
    groupedResults[item.spaceType]!.add(item);
    // if (groupedResults[item.spaceType]!.length < 5) {
    //   groupedResults[item.spaceType]!.add(item);
    // }
  }

  return ListView(
    padding: EdgeInsets.zero,
    children: [
      if (groupedResults[SpaceType.region]!.isNotEmpty) ...[
        buildSection(
            '지역',
            isAllSection
                ? (groupedResults[SpaceType.region]!.length > 5
                    ? groupedResults[SpaceType.region]!.sublist(0, 5)
                    : groupedResults[SpaceType.region]!)
                : groupedResults[SpaceType.region]!,
            groupedResults[SpaceType.region]!.length > 5,
            isAllSection),
      ],
      isAllSection
          ? CustomDivider(color: AppColors.lightColor_2)
          : SizedBox.shrink(),
      if (groupedResults[SpaceType.space]!.isNotEmpty) ...[
        buildSection(
          '공간',
          isAllSection
              ? (groupedResults[SpaceType.space]!.length > 5
                  ? groupedResults[SpaceType.space]!.sublist(0, 5)
                  : groupedResults[SpaceType.space]!)
              : groupedResults[SpaceType.space]!,
          groupedResults[SpaceType.space]!.length > 5,
          isAllSection,
        ),
      ],
      isAllSection
          ? CustomDivider(color: AppColors.lightColor_2)
          : SizedBox.shrink(),
      if (groupedResults[SpaceType.restaurant]!.isNotEmpty) ...[
        buildSection(
          '음식',
          isAllSection
              ? (groupedResults[SpaceType.restaurant]!.length > 5
                  ? groupedResults[SpaceType.restaurant]!.sublist(0, 5)
                  : groupedResults[SpaceType.restaurant]!)
              : groupedResults[SpaceType.restaurant]!,
          groupedResults[SpaceType.restaurant]!.length > 5,
          isAllSection,
        ),
      ],
      isAllSection
          ? CustomDivider(color: AppColors.lightColor_2)
          : SizedBox.shrink(),
      if (groupedResults[SpaceType.cafe]!.isNotEmpty) ...[
        buildSection(
          '카페',
          isAllSection
              ? (groupedResults[SpaceType.cafe]!.length > 5
                  ? groupedResults[SpaceType.cafe]!.sublist(0, 5)
                  : groupedResults[SpaceType.cafe]!)
              : groupedResults[SpaceType.cafe]!,
          groupedResults[SpaceType.cafe]!.length > 5,
          isAllSection,
        ),
      ],
    ],
  );
}

Widget buildSection(
  String title,
  List<FilterResult> results,
  bool showMore,
  bool isAllSection,
) {
  final displayResults = results.toList();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 10.h, left: 18.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      ...displayResults
          .map((item) => BuildResultTile(
                item: item,
              ))
          .toList(),
      SizedBox(height: 20.h),
      if (showMore && isAllSection) ...[
        Padding(
          padding: EdgeInsets.only(bottom: 20.h, left: 18.w, right: 18.w),
          child: SizedBox(
            width: double.infinity,
            height: 48.h,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppColors.darkColor_1, // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              child: Text(
                '전체보기',
                style: TextStyle(
                  color: AppColors.darkColor_1,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    ],
  );
}
