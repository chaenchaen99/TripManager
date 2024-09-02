import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'term_checkbox.g.dart';

@riverpod
class TermCheckBox extends _$TermCheckBox {
  @override
  bool build() {
    return false;
  }

  void toggle() => state = !state;
}
