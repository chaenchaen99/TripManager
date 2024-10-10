import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_manager/%08common/custom_divider.dart';
import 'package:trip_manager/%08common/text_widgets.dart';
import 'package:trip_manager/theme.dart';

import '../../mockup/mockup_datas.dart';

class PlaceDetailPage extends ConsumerWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PlaceDetailAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDivider(),
            TopContentsAboutPlaceDetail(),
            PlaceDetailImages(),
            ShowOperationTime(),
            ShowAddress(),
            ShowPhoneNumber(),
            ShowSiteLink(),
            FindRouteButton(),
          ],
        ),
      ),
    );
  }
}

class FindRouteButton extends StatelessWidget {
  const FindRouteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: 18.0, vertical: 20.0), // 패딩을 줘서 화면에 고정된 느낌 유지
      child: ElevatedButton(
        onPressed: () {
          // 길찾기 버튼 클릭 시 동작
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/find_directions.png",
              width: 16,
              height: 16,
            ),
            SizedBox(width: 4),
            text14Normal(
              text: "길찾기",
              weight: FontWeight.w600,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          side: BorderSide(
            color: AppColors.darkColor_1,
          ),
        ),
      ),
    );
  }
}

class ShowSiteLink extends StatelessWidget {
  const ShowSiteLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 18, top: 16),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/link.png",
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              text14Normal(
                text: "http://hangang.seoul.go.kr",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowAddress extends StatelessWidget {
  const ShowAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 18, top: 16),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/location_info.png",
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              text14Normal(
                text: "서울 광진구 강변북로 139",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowPhoneNumber extends StatelessWidget {
  const ShowPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 18, top: 16),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/call.png",
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              text14Normal(
                text: "010-9645-1697",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowOperationTime extends StatelessWidget {
  const ShowOperationTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 18, top: 16),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/alarm.png",
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              text14Normal(
                text: "영업 전",
                weight: FontWeight.w600,
              ),
              text14Normal(
                text: " " + "10:00 오픈" + "  ",
              ),
              Image.asset(
                "assets/icons/arrow_bottom.png",
                width: 14,
                height: 14,
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
        Visibility(
          visible: false, // _isExpanded가 true일 때만 보임
          child: Container(
            padding: EdgeInsets.only(left: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    text14Normal(text: "월", weight: FontWeight.w600),
                    SizedBox(width: 8),
                    text14Normal(text: "10:00 - 22:00"),
                  ],
                ),
                Row(
                  children: [
                    text14Normal(text: "화", weight: FontWeight.w600),
                    SizedBox(width: 8),
                    text14Normal(text: "10:00 - 22:00"),
                  ],
                ),
                Row(
                  children: [
                    text14Normal(text: "수", weight: FontWeight.w600),
                    SizedBox(width: 8),
                    text14Normal(text: "10:00 - 22:00"),
                  ],
                ),
                Row(
                  children: [
                    text14Normal(text: "목", weight: FontWeight.w600),
                    SizedBox(width: 8),
                    text14Normal(text: "10:00 - 22:00"),
                  ],
                ),
                Row(
                  children: [
                    text14Normal(text: "금", weight: FontWeight.w600),
                    SizedBox(width: 8),
                    text14Normal(text: "10:00 - 22:00"),
                  ],
                ),
                Row(
                  children: [
                    text14Normal(text: "토", weight: FontWeight.w600),
                    SizedBox(width: 8),
                    text14Normal(text: "10:00 - 22:00"),
                  ],
                ),
                Row(
                  children: [
                    text14Normal(text: "일", weight: FontWeight.w600),
                    SizedBox(width: 8),
                    text14Normal(text: "10:00 - 22:00"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PlaceDetailImages extends StatelessWidget {
  const PlaceDetailImages({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 330,
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final displayItem = displayList[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        displayItem['imageUrl'] ?? '',
                        height: 309,
                        width: 236,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TopContentsAboutPlaceDetail extends StatelessWidget {
  const TopContentsAboutPlaceDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text12Normal(text: "공원", color: AppColors.darkColor_3),
          SizedBox(height: 4.h),
          text20Bold(text: "뚝섬 한강공원"),
          SizedBox(height: 8.h),
          Row(
            children: [
              Image.asset(
                "assets/icons/star.png",
                width: 16.w,
                height: 16.h,
              ),
              SizedBox(width: 4.w),
              text12Normal(
                text: "4.9",
                color: AppColors.darkColor_1,
              ),
              SizedBox(width: 12.w),
              text12Normal(
                text: "리뷰 ${1203}",
                color: AppColors.darkColor_3,
              ),
              Image.asset(
                "assets/icons/arrow_right.png",
                width: 12.w,
                height: 12.h,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar PlaceDetailAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/icons/home.png',
            width: 28,
            height: 28,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/icons/bookmark.png',
            width: 28,
            height: 28,
          ),
        ),
      ],
    ),
  );
}
