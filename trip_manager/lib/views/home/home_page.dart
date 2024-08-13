import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/strings.dart';
import 'package:trip_manager/theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> imagePaths = [
      'assets/images/test/test_img_1.png',
      'assets/images/test/test_img_2.png',
      'assets/images/test/test_img_3.png',
    ];
    final List<Map<String, String>> areaList = [
      {
        'imageUrl': 'assets/images/test/city_test_1.png',
        'name': '강남·서초',
      },
      {
        'imageUrl': 'assets/images/test/city_test_2.png',
        'name': '홍대·신촌',
      },
      {
        'imageUrl': 'assets/images/test/city_test_3.png',
        'name': '망원·합정',
      },
      {
        'imageUrl': 'assets/images/test/city_test_4.png',
        'name': '압구정·청담',
      },
      {
        'imageUrl': 'assets/images/test/city_test_1.png',
        'name': '구로·가산',
      },
    ];
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
          children: [
            // PageView의 높이를 동적으로 설정
            MainPageView(screenWidth: screenWidth, imagePaths: imagePaths),
            const SizedBox(height: 36), // PageView와 추가 콘텐츠 사이의 간격
            AreaListView(areaList: areaList),
          ],
        ),
      ),
    );
  }
}

class AreaListView extends StatelessWidget {
  const AreaListView({
    super.key,
    required this.areaList,
  });

  final List<Map<String, String>> areaList;

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

class MainPageView extends StatelessWidget {
  const MainPageView({
    super.key,
    required this.screenWidth,
    required this.imagePaths,
  });

  final double screenWidth;
  final List<String> imagePaths;

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
