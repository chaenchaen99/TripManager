import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'waypoints_info.freezed.dart';
part 'waypoints_info.g.dart';

@freezed
class WaypointState with _$WaypointState {
  const factory WaypointState({
    @Default([]) List<Waypoint> waypoints,
    @Default(false) bool isLoading,
  }) = _WaypointState;
}

@freezed
class Waypoint with _$Waypoint {
  const factory Waypoint({
    required String title,
    String? type,
    @Default("assets/images/test/test_img_1.png") String imageUrl,
    required LatLng latlng,
  }) = _Waypoint;
}

@riverpod
class WaypointsInfo extends _$WaypointsInfo {
  @override
  WaypointState build() {
    return WaypointState(
      waypoints: [],
      isLoading: false,
    );
  }

  //to be deleted!! because these are mock up datas.
  final List<Waypoint> _waypoints = [
    Waypoint(title: '경복궁', type: '관광지', latlng: LatLng(37.579617, 126.977041)),
    Waypoint(
        title: '남산 서울타워', type: '관광지', latlng: LatLng(37.551169, 126.988227)),
    Waypoint(title: '인사동', type: '관광지', latlng: LatLng(37.578062, 126.989224)),
    Waypoint(title: '홍대', type: '관광지', latlng: LatLng(37.557945, 126.925128)),
  ];

  Future<void> getWaypoints() async {
    state = state.copyWith(isLoading: true);

    // 상태 수정 지연
    await Future.delayed(Duration(seconds: 2), () {
      state = state.copyWith(waypoints: _waypoints, isLoading: false);
    });
  }
}
