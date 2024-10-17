import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/ai/controller/ai_course_detail_controller.dart';
import 'package:trip_manager/views/ai/providers/position_info.dart';
import 'package:trip_manager/views/ai/widgets/ai_timeline_item.dart';
import 'package:trip_manager/views/ai/widgets/timeline_widget.dart';

class AiCourseDetailPage extends ConsumerStatefulWidget {
  final AiResponse courseItem;
  const AiCourseDetailPage({
    super.key,
    required this.courseItem,
  });

  @override
  ConsumerState<AiCourseDetailPage> createState() => _AiCourseDetailPageState();
}

class _AiCourseDetailPageState extends ConsumerState<AiCourseDetailPage> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final _controller = AiCourseDetailController(ref: ref);

    return Scaffold(
        appBar: appBar(context),
        body: Stack(
          children: [
            Positioned(
              top: 0, // 화면 하단에 고정
              left: 0,
              right: 0,
              child: Container(
                height: 300.h,
                child: FutureBuilder<Set<Marker>>(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    return GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _controller.calculateWaypointsCenter(),
                        zoom: 12.0,
                      ),
                      markers: snapshot.data ?? {},
                      polylines: _controller.createPolylines(),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    );
                  },
                  future: _controller.createMarkers(),
                ),
              ),
            ),
            Positioned(
              bottom: 0, // 화면 하단에 고정
              left: 0,
              right: 0,
              child: Container(
                height: 680.h, // BottomCourseTimeline의 높이
                child: const BottomCourseTimeline(),
              ),
            ),
          ],
        ));
  }
}

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: const Center(
      child: Text(
        '코스 1',
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
  );
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
