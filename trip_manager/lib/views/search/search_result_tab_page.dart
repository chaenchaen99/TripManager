import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_manager/%08common/constants.dart';
import 'package:trip_manager/%08common/custom_divider.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/providers/search_notifier.dart';
import '../../models/search/filter_result.dart';
import 'widgets/search_result_item.dart';

class SearchResultTabPage extends ConsumerWidget {
  final List<FilterResult> filteredResults;
  final bool isAllTab;
  final TabController tabController;
  const SearchResultTabPage({
    super.key,
    required this.filteredResults,
    required this.isAllTab,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchNotifier = ref.read(searchNotifierProvider.notifier);
    // final searchResult = ref.watch(searchNotifierProvider);
    final groupedResults =
        searchNotifier.getAlldResultsByCategory(filteredResults);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (groupedResults[SpaceType.region]!.isNotEmpty) ...[
          buildSection(
            AppConstants.CATEGORY_REGION,
            searchNotifier.getDisplayResultsInAllTab(
              groupedResults[SpaceType.region] ?? [],
              isAllTab,
            ),
            groupedResults[SpaceType.region]!.length > 5,
            isAllTab,
            tabController,
          ),
        ],
        isAllTab
            ? CustomDivider(color: AppColors.lightColor_2)
            : SizedBox.shrink(),
        if (groupedResults[SpaceType.space]!.isNotEmpty) ...[
          buildSection(
            AppConstants.CATEGORY_SPACE,
            searchNotifier.getDisplayResultsInAllTab(
              groupedResults[SpaceType.space] ?? [],
              isAllTab,
            ),
            groupedResults[SpaceType.space]!.length > 5,
            isAllTab,
            tabController,
          ),
        ],
        isAllTab
            ? CustomDivider(color: AppColors.lightColor_2)
            : SizedBox.shrink(),
        if (groupedResults[SpaceType.restaurant]!.isNotEmpty) ...[
          buildSection(
            AppConstants.CATEGORY_RESTAURANT,
            searchNotifier.getDisplayResultsInAllTab(
              groupedResults[SpaceType.restaurant] ?? [],
              isAllTab,
            ),
            groupedResults[SpaceType.restaurant]!.length > 5,
            isAllTab,
            tabController,
          ),
        ],
        isAllTab
            ? CustomDivider(color: AppColors.lightColor_2)
            : SizedBox.shrink(),
        if (groupedResults[SpaceType.cafe]!.isNotEmpty) ...[
          buildSection(
              AppConstants.CATEGORY_CAFE,
              searchNotifier.getDisplayResultsInAllTab(
                groupedResults[SpaceType.cafe] ?? [],
                isAllTab,
              ),
              groupedResults[SpaceType.cafe]!.length > 5,
              isAllTab,
              tabController),
        ],
      ],
    );
  }
}

Widget buildSection(
  String title,
  List<FilterResult> results,
  bool showMore,
  bool isAllTab,
  TabController tabController,
) {
  final displayResults = results.toList();

  void _onCategoryButtonPressed(String title) {
    switch (title) {
      case AppConstants.CATEGORY_SPACE:
        tabController.index = 1;
        break;
      case AppConstants.CATEGORY_REGION:
        tabController.index = 2;
        break;
      case AppConstants.CATEGORY_RESTAURANT:
        tabController.index = 3;
        break;
      case AppConstants.CATEGORY_CAFE:
        tabController.index = 4;
        break;
    }
  }

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
          .map((item) => SearchResultItem(
                item: item,
              ))
          .toList(),
      SizedBox(height: 20.h),
      if (showMore && isAllTab) ...[
        Padding(
          padding: EdgeInsets.only(bottom: 20.h, left: 18.w, right: 18.w),
          child: SizedBox(
            width: double.infinity,
            height: 48.h,
            child: OutlinedButton(
              onPressed: () => _onCategoryButtonPressed,
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
