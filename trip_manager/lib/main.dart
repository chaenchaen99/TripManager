import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip_manager/config/router/router_provider.dart';
import 'package:trip_manager/global.dart';
import 'package:trip_manager/theme.dart';

void main() {
  Global.init();
  runApp(
      const ProviderScope(child: KeyboardVisibilityProvider(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: tripManagerTheme,
            routerConfig: router,
            builder: FToastBuilder(),
          );
        });
  }
}
