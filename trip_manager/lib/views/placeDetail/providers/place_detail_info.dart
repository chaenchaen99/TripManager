import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'place_detail_info.freezed.dart';
part 'place_detail_info.g.dart';

@freezed
class PlaceDetailInfoState with _$PlaceDetailInfoState {
  const factory PlaceDetailInfoState({
    @Default('') String id,
    @Default('') String type,
    @Default('') String name,
    @Default(0.0) double rating,
    @Default([]) List<String> imagePath,
    @Default(false) bool isOpen,
    @Default({}) Map<String, String> businessTimeInfos,
    @Default(false) bool isBusinessTimeVisible,
    @Default('') String address,
    @Default('') String phoneNumber,
    @Default('') String siteUrl,
  }) = _PlaceDetailInfoState;
}

@riverpod
class PlaceDetailInfo extends _$PlaceDetailInfo {
  @override
  PlaceDetailInfoState build() {
    return PlaceDetailInfoState();
  }

  Future<void> getPlaceDetailInfo(String id) async {
    //TODO: 서버에서 placeDetail Info 가져오기 await

    state = state.copyWith(
      id: '123523523',
      type: '공원',
      name: '뚝섬 한강공원',
      rating: 4.9,
      imagePath: [
        'assets/images/test/test_img_1.png',
        'assets/images/test/test_img_1.png',
        'assets/images/test/test_img_1.png'
      ],
      isOpen: true,
      businessTimeInfos: {
        "월": "10:00-24:00",
        "화": "10:00-24:00",
        "수": "10:00-24:00",
        "목": "10:00-24:00",
        "금": "10:00-24:00",
        "토": "10:00-24:00",
        "일": "10:00-24:00",
      },
      address: '서울 광진구 강변북로 139',
      phoneNumber: '02-2468-3942',
      siteUrl: 'https://hangang.seoul.go.kr',
    );
  }

  toggleBusinessTimeBtn() {
    state = state.copyWith(isBusinessTimeVisible: !state.isBusinessTimeVisible);
  }
}
