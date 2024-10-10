import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_manager/models/search/filter_result.dart';

part 'selected_item.g.dart';

@riverpod
class SelectedItem extends _$SelectedItem {
  @override
  FilterResult? build() {
    return null;
  }

  setSelectedItem(FilterResult selectedItem) {
    state = selectedItem;
  }

  deleteSelectedItem() {
    state = null;
  }
}
