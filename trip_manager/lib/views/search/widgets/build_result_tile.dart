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
      title: Row(
        children: [
          item.spaceType == SpaceType.region
              ? CircularIconWidget()
              : Image.asset(
                  'assets/icons/schedule.png',
                  width: 20,
                  height: 20,
                ),
          SizedBox(width: 12),
          Column(children: [
            Row(children: [
              Text(
                item.name,
                style: TextStyle(fontSize: 16.sp),
              ),
              Text(
                //TODO: 실데이터로 변경
                "1255",
                style: TextStyle(fontSize: 12.sp),
              ),
            ]),
            Text(
              //TODO: 실데이터로 변경
              "서울",
              style: TextStyle(fontSize: 12.sp),
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
      ),
      onTap: () {},
    );
  }
}

class CircularIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
