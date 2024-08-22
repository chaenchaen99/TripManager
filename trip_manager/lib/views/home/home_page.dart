import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/theme.dart';

import '../../mockup/mockup_datas.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/trip_manager.png',
              width: 148,
              height: 25,
            ),
            Image.asset(
              'assets/icons/search.png',
              width: 28,
              height: 28,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PageView의 높이를 동적으로 설정
            MainPageView(screenWidth: screenWidth),
            const SizedBox(height: 36), // PageView와 추가 콘텐츠 사이의 간격
            const AreaListView(),
            const SizedBox(height: 52),
            const DisplayListView(),
          ],
        ),
      ),
    );
  }
}

class MainPageView extends StatelessWidget {
  const MainPageView({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: 449, // 화면의 절반을 PageView로 사용
      child: PageView(
        children: imagePaths.map((path) {
          return Container(
            width: screenWidth,
            color: Colors.black,
            child: Center(
              child: Image.asset(
                path,
                width: screenWidth,
                height: 449,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class AreaListView extends StatelessWidget {
  const AreaListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '어디로 가고싶으세요~?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: areaList.length,
              itemBuilder: (context, index) {
                final city = areaList[index];
                return Container(
                  padding: const EdgeInsets.only(right: 19),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35, // 원형의 반지름
                        backgroundImage: AssetImage(city['imageUrl'] ??
                            'assets/icons/home.png'), // 이미지 배경
                      ),
                      const SizedBox(height: 8),
                      Text(
                        city['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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

class DisplayListView extends StatelessWidget {
  const DisplayListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '최신 전시/팝업 스토어를 소개합니다.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final displayItem = displayList[index];
                final displayName = displayItem['name'] ?? '';
                final period = displayItem['peroid'] ?? '';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.asset(
                        displayItem['imageUrl'] ?? '',
                        height: 200,
                        width: 160,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 140,
                        child: Text(
                          displayName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 140,
                        child: Text(
                          period,
                          style: const TextStyle(
                            color: AppColors.darkColor_3,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
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
