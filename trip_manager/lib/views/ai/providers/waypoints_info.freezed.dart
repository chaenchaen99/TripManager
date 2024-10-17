// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waypoints_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WaypointState {
  List<Waypoint> get waypoints => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WaypointStateCopyWith<WaypointState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaypointStateCopyWith<$Res> {
  factory $WaypointStateCopyWith(
          WaypointState value, $Res Function(WaypointState) then) =
      _$WaypointStateCopyWithImpl<$Res, WaypointState>;
  @useResult
  $Res call({List<Waypoint> waypoints, bool isLoading});
}

/// @nodoc
class _$WaypointStateCopyWithImpl<$Res, $Val extends WaypointState>
    implements $WaypointStateCopyWith<$Res> {
  _$WaypointStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waypoints = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      waypoints: null == waypoints
          ? _value.waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaypointStateImplCopyWith<$Res>
    implements $WaypointStateCopyWith<$Res> {
  factory _$$WaypointStateImplCopyWith(
          _$WaypointStateImpl value, $Res Function(_$WaypointStateImpl) then) =
      __$$WaypointStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Waypoint> waypoints, bool isLoading});
}

/// @nodoc
class __$$WaypointStateImplCopyWithImpl<$Res>
    extends _$WaypointStateCopyWithImpl<$Res, _$WaypointStateImpl>
    implements _$$WaypointStateImplCopyWith<$Res> {
  __$$WaypointStateImplCopyWithImpl(
      _$WaypointStateImpl _value, $Res Function(_$WaypointStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waypoints = null,
    Object? isLoading = null,
  }) {
    return _then(_$WaypointStateImpl(
      waypoints: null == waypoints
          ? _value._waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoint>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WaypointStateImpl implements _WaypointState {
  const _$WaypointStateImpl(
      {final List<Waypoint> waypoints = const [], this.isLoading = false})
      : _waypoints = waypoints;

  final List<Waypoint> _waypoints;
  @override
  @JsonKey()
  List<Waypoint> get waypoints {
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waypoints);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'WaypointState(waypoints: $waypoints, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaypointStateImpl &&
            const DeepCollectionEquality()
                .equals(other._waypoints, _waypoints) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_waypoints), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WaypointStateImplCopyWith<_$WaypointStateImpl> get copyWith =>
      __$$WaypointStateImplCopyWithImpl<_$WaypointStateImpl>(this, _$identity);
}

abstract class _WaypointState implements WaypointState {
  const factory _WaypointState(
      {final List<Waypoint> waypoints,
      final bool isLoading}) = _$WaypointStateImpl;

  @override
  List<Waypoint> get waypoints;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$WaypointStateImplCopyWith<_$WaypointStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Waypoint {
  String get title => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  LatLng get latlng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WaypointCopyWith<Waypoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaypointCopyWith<$Res> {
  factory $WaypointCopyWith(Waypoint value, $Res Function(Waypoint) then) =
      _$WaypointCopyWithImpl<$Res, Waypoint>;
  @useResult
  $Res call({String title, String? type, String imageUrl, LatLng latlng});
}

/// @nodoc
class _$WaypointCopyWithImpl<$Res, $Val extends Waypoint>
    implements $WaypointCopyWith<$Res> {
  _$WaypointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = freezed,
    Object? imageUrl = null,
    Object? latlng = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latlng: null == latlng
          ? _value.latlng
          : latlng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaypointImplCopyWith<$Res>
    implements $WaypointCopyWith<$Res> {
  factory _$$WaypointImplCopyWith(
          _$WaypointImpl value, $Res Function(_$WaypointImpl) then) =
      __$$WaypointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? type, String imageUrl, LatLng latlng});
}

/// @nodoc
class __$$WaypointImplCopyWithImpl<$Res>
    extends _$WaypointCopyWithImpl<$Res, _$WaypointImpl>
    implements _$$WaypointImplCopyWith<$Res> {
  __$$WaypointImplCopyWithImpl(
      _$WaypointImpl _value, $Res Function(_$WaypointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = freezed,
    Object? imageUrl = null,
    Object? latlng = null,
  }) {
    return _then(_$WaypointImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latlng: null == latlng
          ? _value.latlng
          : latlng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$WaypointImpl implements _Waypoint {
  const _$WaypointImpl(
      {required this.title,
      this.type,
      this.imageUrl = "assets/images/test/test_img_1.png",
      required this.latlng});

  @override
  final String title;
  @override
  final String? type;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  final LatLng latlng;

  @override
  String toString() {
    return 'Waypoint(title: $title, type: $type, imageUrl: $imageUrl, latlng: $latlng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaypointImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.latlng, latlng) || other.latlng == latlng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, type, imageUrl, latlng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WaypointImplCopyWith<_$WaypointImpl> get copyWith =>
      __$$WaypointImplCopyWithImpl<_$WaypointImpl>(this, _$identity);
}

abstract class _Waypoint implements Waypoint {
  const factory _Waypoint(
      {required final String title,
      final String? type,
      final String imageUrl,
      required final LatLng latlng}) = _$WaypointImpl;

  @override
  String get title;
  @override
  String? get type;
  @override
  String get imageUrl;
  @override
  LatLng get latlng;
  @override
  @JsonKey(ignore: true)
  _$$WaypointImplCopyWith<_$WaypointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
