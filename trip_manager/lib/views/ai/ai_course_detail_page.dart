import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/ai/controller/ai_course_detail_controller.dart';
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
  late GoogleMapController _mapController;
  late AiCourseDetailController _controller;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _controller = AiCourseDetailController(ref: ref);
    _controller.loadWaypoints();
  }

  @override
  Widget build(BuildContext context) {
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
                child: BottomCourseTimeline(
                  controller: _controller,
                ),
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
  final AiCourseDetailController controller;
  const BottomCourseTimeline({
    super.key,
    required this.controller,
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
                        itemCount: controller.getWaypoints().length,
                        itemBuilder: (context, index) {
                          final _waypoint = controller.getWaypoints()[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TimelineWidget(number: index + 1),
                                  const SizedBox(width: 8),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: AiTimelineItem(
                                        courseItem: AiResponse(
                                            imageUrl: _waypoint.imageUrl,
                                            title: _waypoint.title,
                                            subTitle: _waypoint.type ?? '')),
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
