import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/%08common/custom_divider.dart';
import 'package:trip_manager/%08common/text_widgets.dart';
import 'package:trip_manager/config/router/router_names.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/placeDetail/providers/place_detail_info.dart';

import '../../mockup/mockup_datas.dart';

class PlaceDetailPage extends ConsumerStatefulWidget {
  final String placeId;

  const PlaceDetailPage({super.key, required this.placeId});

  @override
  ConsumerState<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends ConsumerState<PlaceDetailPage> {
  @override
  void initState() {
    super.initState();
    ref
        .read(placeDetailInfoProvider.notifier)
        .getPlaceDetailInfo(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    final placeDetailState = ref.watch(placeDetailInfoProvider);

    return Scaffold(
      appBar: PlaceDetailAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDivider(),
            TopContentsAboutPlaceDetail(
              type: placeDetailState.type,
              name: placeDetailState.name,
              rating: placeDetailState.rating,
            ),
            PlaceDetailImages(
              imagePaths: placeDetailState.imagePath,
            ),
            ShowOperationTime(
              isOpen: placeDetailState.isOpen,
              isBusinessTimeVisible: placeDetailState.isBusinessTimeVisible,
              businessTimes: placeDetailState.businessTimeInfos,
            ),
            ShowAddress(
              address: placeDetailState.address,
            ),
            ShowPhoneNumber(
              phoneNumber: placeDetailState.phoneNumber,
            ),
            ShowSiteLink(
              siteUrl: placeDetailState.siteUrl,
            ),
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
          backgroundColor: Colors.white,
          side: BorderSide(
            color: AppColors.darkColor_1,
          ),
          elevation: 0,
        ),
      ),
    );
  }
}

class ShowSiteLink extends StatelessWidget {
  final String siteUrl;
  const ShowSiteLink({
    super.key,
    required this.siteUrl,
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
                text: siteUrl,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowAddress extends StatelessWidget {
  final String address;
  const ShowAddress({
    super.key,
    required this.address,
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
                text: address,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowPhoneNumber extends StatelessWidget {
  final String phoneNumber;
  const ShowPhoneNumber({
    super.key,
    required this.phoneNumber,
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
                text: phoneNumber,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowOperationTime extends ConsumerWidget {
  final Map<String, String> businessTimes;
  final bool isOpen;
  final bool isBusinessTimeVisible;
  const ShowOperationTime({
    super.key,
    required this.businessTimes,
    required this.isOpen,
    required this.isBusinessTimeVisible,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            print("터치됨");
            ref.read(placeDetailInfoProvider.notifier).toggleBusinessTimeBtn();
          },
          child: Container(
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
                  text: isOpen ? "영업 중" : "영업 전",
                  weight: FontWeight.w600,
                ),
                text14Normal(
                  text: " " + "10:00 오픈" + "  ",
                ),
                Container(
                  padding: EdgeInsets.only(top: 1),
                  alignment: Alignment.center,
                  child: Image.asset(
                    isBusinessTimeVisible
                        ? "assets/icons/arrow_top.png"
                        : "assets/icons/arrow_bottom.png",
                    width: 14,
                    height: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isBusinessTimeVisible, // _isExpanded가 true일 때만 보임
          child: Container(
            padding: EdgeInsets.only(left: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var time in businessTimes.entries) // Map의 각 항목에 대해 반복
                  Row(
                    children: [
                      text14Normal(
                          text: time.key, weight: FontWeight.w600), // 요일
                      SizedBox(width: 8),
                      text14Normal(text: time.value), // 시간
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
  final List<String> imagePaths;
  const PlaceDetailImages({
    super.key,
    required this.imagePaths,
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
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                final _image = imagePaths[index];

                return Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0), // 이미지 간의 간격을 8으로 설정
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // 8 픽셀의 radius 적용
                    child: Image.asset(
                      _image,
                      height: 309, // 세로 309 픽셀
                      width: 236, // 가로 236 픽셀
                      fit: BoxFit.cover, // 이미지가 잘리거나 왜곡되지 않도록 설정
                    ),
                  ),
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
  final String type;
  final String name;
  final double rating;
  const TopContentsAboutPlaceDetail({
    super.key,
    required this.type,
    required this.name,
    required this.rating,
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
          text12Normal(text: type, color: AppColors.darkColor_3),
          SizedBox(height: 4.h),
          text20Bold(text: name),
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
                text: rating.toString(),
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
          onTap: () => context.goNamed(RouteNames.home),
          child: Image.asset(
            'assets/icons/home.png',
            width: 28,
            height: 28,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () => context.goNamed(RouteNames.bookmark),
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
