import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_result.freezed.dart';

enum SpaceType { region, space, restaurant, cafe }

@freezed
class FilterResult with _$FilterResult {
  const factory FilterResult({
    @Default(SpaceType.region) spaceType,
    required String name,
    @Default('') String subInfo,
    @Default(false) bool showMore,
  }) = _FilterResult;
}
