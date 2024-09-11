// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterResult {
  dynamic get spaceType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get subInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterResultCopyWith<FilterResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterResultCopyWith<$Res> {
  factory $FilterResultCopyWith(
          FilterResult value, $Res Function(FilterResult) then) =
      _$FilterResultCopyWithImpl<$Res, FilterResult>;
  @useResult
  $Res call({dynamic spaceType, String name, String subInfo});
}

/// @nodoc
class _$FilterResultCopyWithImpl<$Res, $Val extends FilterResult>
    implements $FilterResultCopyWith<$Res> {
  _$FilterResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spaceType = freezed,
    Object? name = null,
    Object? subInfo = null,
  }) {
    return _then(_value.copyWith(
      spaceType: freezed == spaceType
          ? _value.spaceType
          : spaceType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subInfo: null == subInfo
          ? _value.subInfo
          : subInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterResultImplCopyWith<$Res>
    implements $FilterResultCopyWith<$Res> {
  factory _$$FilterResultImplCopyWith(
          _$FilterResultImpl value, $Res Function(_$FilterResultImpl) then) =
      __$$FilterResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic spaceType, String name, String subInfo});
}

/// @nodoc
class __$$FilterResultImplCopyWithImpl<$Res>
    extends _$FilterResultCopyWithImpl<$Res, _$FilterResultImpl>
    implements _$$FilterResultImplCopyWith<$Res> {
  __$$FilterResultImplCopyWithImpl(
      _$FilterResultImpl _value, $Res Function(_$FilterResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spaceType = freezed,
    Object? name = null,
    Object? subInfo = null,
  }) {
    return _then(_$FilterResultImpl(
      spaceType: freezed == spaceType ? _value.spaceType! : spaceType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subInfo: null == subInfo
          ? _value.subInfo
          : subInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterResultImpl implements _FilterResult {
  const _$FilterResultImpl(
      {this.spaceType = SpaceType.region,
      required this.name,
      this.subInfo = ''});

  @override
  @JsonKey()
  final dynamic spaceType;
  @override
  final String name;
  @override
  @JsonKey()
  final String subInfo;

  @override
  String toString() {
    return 'FilterResult(spaceType: $spaceType, name: $name, subInfo: $subInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterResultImpl &&
            const DeepCollectionEquality().equals(other.spaceType, spaceType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subInfo, subInfo) || other.subInfo == subInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(spaceType), name, subInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterResultImplCopyWith<_$FilterResultImpl> get copyWith =>
      __$$FilterResultImplCopyWithImpl<_$FilterResultImpl>(this, _$identity);
}

abstract class _FilterResult implements FilterResult {
  const factory _FilterResult(
      {final dynamic spaceType,
      required final String name,
      final String subInfo}) = _$FilterResultImpl;

  @override
  dynamic get spaceType;
  @override
  String get name;
  @override
  String get subInfo;
  @override
  @JsonKey(ignore: true)
  _$$FilterResultImplCopyWith<_$FilterResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
