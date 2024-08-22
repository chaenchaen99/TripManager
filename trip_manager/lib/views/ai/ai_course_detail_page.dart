import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_manager/models/ai/chat_model.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/theme.dart';

class AiCourseDetailPage extends StatelessWidget {
  final AiResponse courseItem;
  const AiCourseDetailPage({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> mapController =
        Completer<GoogleMapController>();

    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // 뒤로가기 버튼 클릭 시 이전 페이지로 돌아갑니다.
            },
          ),
          title: const Center(
            child: Text(
              '코스 1', // 동적으로 변경하려면 chatModel?.response.first.title로 변경할 수 있습니다.
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                print('저장 버튼 클릭됨');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
              ),
            ),
            DraggableScrollableSheet(
              // Add DraggableScrollableSheet here
              builder: (BuildContext context, scrollController) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverList.list(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 180),
                          child: Container(
                            height: 3,
                            color: AppColors.lightColor_2,
                          ),
                        ),
                        const ListTile(title: Text('코스1...')),
                        const ListTile(title: Text('코스2...')),
                      ])
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
