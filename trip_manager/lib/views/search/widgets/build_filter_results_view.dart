import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_manager/%08common/constants.dart';
import 'package:trip_manager/%08common/custom_divider.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/widgets/build_result_tile.dart';
import '../../../models/search/filter_result.dart';

Widget buildFilteredResultsView(
    List<FilterResult> results, isAllSection, tabController) {
  final Map<SpaceType, List<FilterResult>> groupedResults = {
    SpaceType.region: [],
    SpaceType.restaurant: [],
    SpaceType.cafe: [],
    SpaceType.space: [],
  };

  for (var item in results) {
    groupedResults[item.spaceType]!.add(item);
  }

  return ListView(
    padding: EdgeInsets.zero,
    children: [
      if (groupedResults[SpaceType.region]!.isNotEmpty) ...[
        buildSection(
          AppConstants.CATEGORY_REGION,
          isAllSection
              ? (groupedResults[SpaceType.region]!.length > 5
                  ? groupedResults[SpaceType.region]!.sublist(0, 5)
                  : groupedResults[SpaceType.region]!)
              : groupedResults[SpaceType.region]!,
          groupedResults[SpaceType.region]!.length > 5,
          isAllSection,
          tabController,
        ),
      ],
      isAllSection
          ? CustomDivider(color: AppColors.lightColor_2)
          : SizedBox.shrink(),
      if (groupedResults[SpaceType.space]!.isNotEmpty) ...[
        buildSection(
          AppConstants.CATEGORY_SPACE,
          isAllSection
              ? (groupedResults[SpaceType.space]!.length > 5
                  ? groupedResults[SpaceType.space]!.sublist(0, 5)
                  : groupedResults[SpaceType.space]!)
              : groupedResults[SpaceType.space]!,
          groupedResults[SpaceType.space]!.length > 5,
          isAllSection,
          tabController,
        ),
      ],
      isAllSection
          ? CustomDivider(color: AppColors.lightColor_2)
          : SizedBox.shrink(),
      if (groupedResults[SpaceType.restaurant]!.isNotEmpty) ...[
        buildSection(
          AppConstants.CATEGORY_RESTAURANT,
          isAllSection
              ? (groupedResults[SpaceType.restaurant]!.length > 5
                  ? groupedResults[SpaceType.restaurant]!.sublist(0, 5)
                  : groupedResults[SpaceType.restaurant]!)
              : groupedResults[SpaceType.restaurant]!,
          groupedResults[SpaceType.restaurant]!.length > 5,
          isAllSection,
          tabController,
        ),
      ],
      isAllSection
          ? CustomDivider(color: AppColors.lightColor_2)
          : SizedBox.shrink(),
      if (groupedResults[SpaceType.cafe]!.isNotEmpty) ...[
        buildSection(
            AppConstants.CATEGORY_CAFE,
            isAllSection
                ? (groupedResults[SpaceType.cafe]!.length > 5
                    ? groupedResults[SpaceType.cafe]!.sublist(0, 5)
                    : groupedResults[SpaceType.cafe]!)
                : groupedResults[SpaceType.cafe]!,
            groupedResults[SpaceType.cafe]!.length > 5,
            isAllSection,
            tabController),
      ],
    ],
  );
}

Widget buildSection(
  String title,
  List<FilterResult> results,
  bool showMore,
  bool isAllSection,
  TabController tabController,
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
              onPressed: () {
                if (title == AppConstants.CATEGORY_SPACE) {
                  tabController.index = 1;
                } else if (title == AppConstants.CATEGORY_REGION) {
                  tabController.index = 2;
                } else if (title == AppConstants.CATEGORY_RESTAURANT) {
                  tabController.index = 3;
                } else if (title == AppConstants.CATEGORY_CAFE) {
                  tabController.index = 4;
                }
              },
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
