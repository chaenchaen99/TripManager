// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchHistoryState {
  List<String> get history => throw _privateConstructorUsedError;
  List<FilterResult> get filteredResults => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String get selectedTab => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchHistoryStateCopyWith<SearchHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoryStateCopyWith<$Res> {
  factory $SearchHistoryStateCopyWith(
          SearchHistoryState value, $Res Function(SearchHistoryState) then) =
      _$SearchHistoryStateCopyWithImpl<$Res, SearchHistoryState>;
  @useResult
  $Res call(
      {List<String> history,
      List<FilterResult> filteredResults,
      String query,
      String selectedTab});
}

/// @nodoc
class _$SearchHistoryStateCopyWithImpl<$Res, $Val extends SearchHistoryState>
    implements $SearchHistoryStateCopyWith<$Res> {
  _$SearchHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? filteredResults = null,
    Object? query = null,
    Object? selectedTab = null,
  }) {
    return _then(_value.copyWith(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filteredResults: null == filteredResults
          ? _value.filteredResults
          : filteredResults // ignore: cast_nullable_to_non_nullable
              as List<FilterResult>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTab: null == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchHistoryStateImplCopyWith<$Res>
    implements $SearchHistoryStateCopyWith<$Res> {
  factory _$$SearchHistoryStateImplCopyWith(_$SearchHistoryStateImpl value,
          $Res Function(_$SearchHistoryStateImpl) then) =
      __$$SearchHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> history,
      List<FilterResult> filteredResults,
      String query,
      String selectedTab});
}

/// @nodoc
class __$$SearchHistoryStateImplCopyWithImpl<$Res>
    extends _$SearchHistoryStateCopyWithImpl<$Res, _$SearchHistoryStateImpl>
    implements _$$SearchHistoryStateImplCopyWith<$Res> {
  __$$SearchHistoryStateImplCopyWithImpl(_$SearchHistoryStateImpl _value,
      $Res Function(_$SearchHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? filteredResults = null,
    Object? query = null,
    Object? selectedTab = null,
  }) {
    return _then(_$SearchHistoryStateImpl(
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filteredResults: null == filteredResults
          ? _value._filteredResults
          : filteredResults // ignore: cast_nullable_to_non_nullable
              as List<FilterResult>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTab: null == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchHistoryStateImpl implements _SearchHistoryState {
  const _$SearchHistoryStateImpl(
      {required final List<String> history,
      required final List<FilterResult> filteredResults,
      required this.query,
      required this.selectedTab})
      : _history = history,
        _filteredResults = filteredResults;

  final List<String> _history;
  @override
  List<String> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  final List<FilterResult> _filteredResults;
  @override
  List<FilterResult> get filteredResults {
    if (_filteredResults is EqualUnmodifiableListView) return _filteredResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredResults);
  }

  @override
  final String query;
  @override
  final String selectedTab;

  @override
  String toString() {
    return 'SearchHistoryState(history: $history, filteredResults: $filteredResults, query: $query, selectedTab: $selectedTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHistoryStateImpl &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality()
                .equals(other._filteredResults, _filteredResults) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_filteredResults),
      query,
      selectedTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHistoryStateImplCopyWith<_$SearchHistoryStateImpl> get copyWith =>
      __$$SearchHistoryStateImplCopyWithImpl<_$SearchHistoryStateImpl>(
          this, _$identity);
}

abstract class _SearchHistoryState implements SearchHistoryState {
  const factory _SearchHistoryState(
      {required final List<String> history,
      required final List<FilterResult> filteredResults,
      required final String query,
      required final String selectedTab}) = _$SearchHistoryStateImpl;

  @override
  List<String> get history;
  @override
  List<FilterResult> get filteredResults;
  @override
  String get query;
  @override
  String get selectedTab;
  @override
  @JsonKey(ignore: true)
  _$$SearchHistoryStateImplCopyWith<_$SearchHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
