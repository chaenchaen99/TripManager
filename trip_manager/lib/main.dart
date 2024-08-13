import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/config/router/router_provider.dart';
import 'package:trip_manager/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: tripManagerTheme,
      routerConfig: router,
    );
  }
}
