import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tickerProvider = Provider<TickerProvider>((ref) {
  // TickerProvider를 반환합니다. StatefulWidget의 경우, `SingleTickerProviderStateMixin`을 사용합니다.
  // 여기에 구체적인 TickerProvider를 구현해주어야 합니다.
  throw UnimplementedError('TickerProvider is not implemented');
});

final tabControllerProvider = Provider<TabController>((ref) {
  final _tickerProvider = ref.watch(tickerProvider); // TickerProvider를 제공받습니다.
  return TabController(length: 5, vsync: _tickerProvider);
});
