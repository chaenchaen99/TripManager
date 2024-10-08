import 'package:flutter/material.dart';

final ThemeData tripManagerTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Pretendard",
  appBarTheme: const AppBarTheme(
    //앱 바의 테마 설정
    backgroundColor: Colors.white,
    //스크롤시 앱바 색 변경되는 부분 수정
    scrolledUnderElevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
    filled: true,
    fillColor: AppColors.lightColor_1,
    hintStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.darkColor_3,
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red, // 오류 시 언더라인 색상
        width: 1.0,
      ),
    ),
    errorStyle: const TextStyle(
      color: Colors.red,
      fontSize: 12, // 원하는 폰트 크기
      fontWeight: FontWeight.w400, // 원하는 폰트 두께
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red, // 오류 시 포커스된 상태의 언더라인 색상
        width: 1.0,
      ),
    ),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 36.0),
  ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
);

class AppColors extends Color {
  AppColors(super.value);

  static const Color mainColor = Color(0xff28A3FB);
  static const Color subColor_1 = Color(0xff00C7F2);
  static const Color subColor_2 = Color(0xffE9F650);
  static const Color darkColor_1 = Color(0xff201D20);
  static const Color darkColor_2 = Color(0xff183347);
  static const Color darkColor_3 = Color(0xff848893);
  static const Color lightColor_1 = Color(0xffF3F5FA);
  static const Color lightColor_2 = Color(0xffEFEFEF);
  static const Color lightColor_3 = Color(0xffFFFFFF);
  static const Color lightColor_4 = Color(0xffBBBEC7);
  static const Color kakaoMainColor = Color(0xffFFE300);
  static const Color naverMainColor = Color(0xff03C75A);
  static const Color appleMainColor = Color(0xff1D1D1F);
  static const Color emailOutlineColor = Color(0xffBBBEC7);
}
  // static const MaterialColor wabizGray =
  //     MaterialColor(grayPrimaryValue, <int, Color>{
  //   50: Color(0xffffebee),
  //   100: Color(0xffe5e5ea),
  //   200: Color(0xffd4d4d4),
  //   300: Color(0xffaeaeb2),
  //   400: Color(0xff828293),
  //   500: Color(grayPrimaryValue),
  //   600: Color(0xff646464),
  //   700: Color(0xff4a4a4a),
  //   800: Color(0xff303030),
  //   900: Color(0xff242424),
  // });

