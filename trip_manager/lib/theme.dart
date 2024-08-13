import 'package:flutter/material.dart';

final ThemeData tripManagerTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Pretendard",
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
  ),
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
  static const Color lightColor_3 = Color(0xffEFEFEF);
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
}
