import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/ai/providers/waypoints_info.dart';
import 'dart:ui' as ui;
import '../providers/position_info.dart';

class AiCourseDetailController {
  final WidgetRef ref;

  AiCourseDetailController({required this.ref});

  LatLng calculateWaypointsCenter() {
    double totalLatitude = 0;
    double totalLongitude = 0;

    List<LatLng> _latlngs = ref
        .watch(waypointsInfoProvider)
        .waypoints
        .map((waypoint) => waypoint.latlng)
        .toList();

    for (var waypoint in _latlngs) {
      totalLatitude += waypoint.latitude;
      totalLongitude += waypoint.longitude;
    }

    int count = _latlngs.length;
    return LatLng(totalLatitude / count, totalLongitude / count);
  }

  Future<BitmapDescriptor> createCustomMarker(int number) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // 동그라미 배경 그리기
    final double circleRadius = 30; // 동그라미 반지름
    final circlePaint = Paint()..color = AppColors.mainColor;
    canvas.drawCircle(
        Offset(circleRadius, circleRadius), circleRadius, circlePaint);

    // 숫자 그리기
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$number',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    // 동그라미 중앙에 텍스트 배치
    final textOffset = Offset(
      circleRadius - (textPainter.width / 2),
      circleRadius - (textPainter.height / 2),
    );
    textPainter.paint(canvas, textOffset);

    final picture = recorder.endRecording();
    final img = await picture.toImage(
        (circleRadius * 2).toInt(), (circleRadius * 2).toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(pngBytes);
  }

  Future<void> loadWaypointState() async {
    await ref.read(waypointsInfoProvider.notifier).getWaypoints();
  }

  WaypointState getWaypointState() {
    return ref.watch(waypointsInfoProvider); // Provider 상태를 반환
  }

  Future<Set<Marker>> createMarkers() async {
    final _waypoints = ref.watch(waypointsInfoProvider).waypoints;
    return {
      for (int i = 0; i < _waypoints.length; i++)
        Marker(
          markerId: MarkerId('waypoint_$i'),
          position: _waypoints[i].latlng,
          icon: await createCustomMarker(i + 1),
        ),
    };
  }

  Set<Polyline> createPolylines() {
    return {
      Polyline(
        polylineId: PolylineId('route'),
        points: ref
            .watch(waypointsInfoProvider)
            .waypoints
            .map((waypoint) => waypoint.latlng)
            .toList(),
        color: AppColors.darkColor_2.withOpacity(0.6),
        width: 2,
        patterns: [
          PatternItem.dash(150),
          PatternItem.gap(120),
        ],
      ),
    };
  }

  LatLng getUserCurrentPosition() {
    return ref.read(positionInfoProvider);
  }
}
