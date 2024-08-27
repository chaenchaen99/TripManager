import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';
import 'package:trip_manager/models/ai/chat_model.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/ai/widgets/ai_timeline_item.dart';
import 'package:trip_manager/views/ai/widgets/timeline_widget.dart';

class AiCourseDetailPage extends StatefulWidget {
  final AiResponse courseItem;
  const AiCourseDetailPage({
    super.key,
    required this.courseItem,
  });

  @override
  State<AiCourseDetailPage> createState() => _AiCourseDetailPageState();
}

class _AiCourseDetailPageState extends State<AiCourseDetailPage> {
  late GoogleMapController mapController;

  final LatLng center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
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
              child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: center,
                    zoom: 11.0,
                  )),
            ),
            const BottomCourseTimeline(),
          ],
        ));
  }
}

class BottomCourseTimeline extends StatelessWidget {
  const BottomCourseTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
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
            child: Column(
              children: [
                Container(
                  width: 58,
                  height: 4,
                  color: AppColors.lightColor_2,
                  margin: const EdgeInsets.only(top: 7), // 손잡이의 상하 여백
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TimelineWidget(number: index + 1),
                                  const SizedBox(width: 8),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: AiTimelineItem(
                                        courseItem: AiResponse(
                                            imageUrl:
                                                'assets/images/test/test_img_1.png',
                                            title: '코스 1',
                                            subTitle: '1번코스 | 2번코스| 3번 코스')),
                                  ),
                                ]),
                          );
                        }),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
