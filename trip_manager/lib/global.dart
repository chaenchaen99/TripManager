import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:trip_manager/const/constants.dart';

class Global {
  static init() {
    WidgetsFlutterBinding.ensureInitialized();

    KakaoSdk.init(
      nativeAppKey: AppConstants.KAKAO_NATIVE_KEY,
    );
  }
}
