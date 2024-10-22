import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_manager/%08common/review_rating_bar.dart';

import '../../common/custom_divider.dart';
import '../../common/text_widgets.dart';
import '../../theme.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReviewAppBar(context),
      body: ListView(
        children: [
          CustomDivider(),
          AddReviewBox(),
          CustomDivider(
            height: 8,
            color: AppColors.lightColor_1,
          ),
          TotalReviewBox(),
          CustomDivider(),
          // ListView.builder 대신 ListTile을 사용하여 리뷰 목록을 생성
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // 내부 ListView가 스크롤되지 않도록 설정
            shrinkWrap: true, // 내부 ListView 크기를 자동으로 조정
            itemCount: 2, // TODO: 하드코딩 수정
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 28.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                Colors.grey, // 이미지가 없을 경우의 배경색 (주석 해제 가능)
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text16Normal(
                                    text: '정수현',
                                    weight: FontWeight.w600,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        ReviewRatingBar(
                                          size: 20,
                                        ),
                                        Spacer(),
                                        text12Normal(
                                          text: '2024.10.10',
                                          color: AppColors.darkColor_3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Text(
                          "재밌었어요~~",
                          style: TextStyle(
                            color: AppColors.darkColor_1,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ), // 폰트 크기 조정
                          maxLines: 2, // 최대 2줄로 제한
                          overflow:
                              TextOverflow.ellipsis, // 줄을 초과하는 경우 생략 부호 추가
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //TODO 하드코딩 변경 필요
                          itemBuilder: (context, index) {
                            // final displayItem = displayList[index];
                            // final displayName = displayItem['name'] ?? '';
                            // final period = displayItem['peroid'] ?? '';

                            return Container(
                              padding: EdgeInsets.only(right: 4.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.asset(
                                  'assets/images/test/test_img_3.png',
                                  height: 184,
                                  width: 160,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddReviewBox extends StatelessWidget {
  const AddReviewBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('방문 리뷰 쓰기'),
          SizedBox(width: 8.w),
          Image.asset(
            'assets/images/test/review_stars.png',
            width: 172.w,
            height: 28.h,
          ),
        ],
      ),
    );
  }
}

class TotalReviewBox extends StatelessWidget {
  const TotalReviewBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline, // 기준선 맞춤 설정
        textBaseline: TextBaseline.alphabetic, // 텍스트 기준선 설정
        children: [
          Container(
            height: 20.h,
            child: ReviewRatingBar(),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.only(top: 4.h),
            child: text24Bold(text: '3.0'),
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget ReviewAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: const Center(
      child: Text(
        '리뷰',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
