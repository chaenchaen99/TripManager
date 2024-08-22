// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'aiResponse':
      return AiResponse.fromJson(json);
    case 'userResponse':
      return UserResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ResponseModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ResponseModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String title, String subTitle)
        aiResponse,
    required TResult Function(String sendMessage) userResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imageUrl, String title, String subTitle)?
        aiResponse,
    TResult? Function(String sendMessage)? userResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String title, String subTitle)?
        aiResponse,
    TResult Function(String sendMessage)? userResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiResponse value) aiResponse,
    required TResult Function(UserResponse value) userResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiResponse value)? aiResponse,
    TResult? Function(UserResponse value)? userResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiResponse value)? aiResponse,
    TResult Function(UserResponse value)? userResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseModelCopyWith<$Res> {
  factory $ResponseModelCopyWith(
          ResponseModel value, $Res Function(ResponseModel) then) =
      _$ResponseModelCopyWithImpl<$Res, ResponseModel>;
}

/// @nodoc
class _$ResponseModelCopyWithImpl<$Res, $Val extends ResponseModel>
    implements $ResponseModelCopyWith<$Res> {
  _$ResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AiResponseImplCopyWith<$Res> {
  factory _$$AiResponseImplCopyWith(
          _$AiResponseImpl value, $Res Function(_$AiResponseImpl) then) =
      __$$AiResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imageUrl, String title, String subTitle});
}

/// @nodoc
class __$$AiResponseImplCopyWithImpl<$Res>
    extends _$ResponseModelCopyWithImpl<$Res, _$AiResponseImpl>
    implements _$$AiResponseImplCopyWith<$Res> {
  __$$AiResponseImplCopyWithImpl(
      _$AiResponseImpl _value, $Res Function(_$AiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? title = null,
    Object? subTitle = null,
  }) {
    return _then(_$AiResponseImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiResponseImpl implements AiResponse {
  const _$AiResponseImpl(
      {required this.imageUrl,
      required this.title,
      required this.subTitle,
      final String? $type})
      : $type = $type ?? 'aiResponse';

  factory _$AiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiResponseImplFromJson(json);

  @override
  final String imageUrl;
  @override
  final String title;
  @override
  final String subTitle;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResponseModel.aiResponse(imageUrl: $imageUrl, title: $title, subTitle: $subTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiResponseImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, title, subTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiResponseImplCopyWith<_$AiResponseImpl> get copyWith =>
      __$$AiResponseImplCopyWithImpl<_$AiResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String title, String subTitle)
        aiResponse,
    required TResult Function(String sendMessage) userResponse,
  }) {
    return aiResponse(imageUrl, title, subTitle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imageUrl, String title, String subTitle)?
        aiResponse,
    TResult? Function(String sendMessage)? userResponse,
  }) {
    return aiResponse?.call(imageUrl, title, subTitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String title, String subTitle)?
        aiResponse,
    TResult Function(String sendMessage)? userResponse,
    required TResult orElse(),
  }) {
    if (aiResponse != null) {
      return aiResponse(imageUrl, title, subTitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiResponse value) aiResponse,
    required TResult Function(UserResponse value) userResponse,
  }) {
    return aiResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiResponse value)? aiResponse,
    TResult? Function(UserResponse value)? userResponse,
  }) {
    return aiResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiResponse value)? aiResponse,
    TResult Function(UserResponse value)? userResponse,
    required TResult orElse(),
  }) {
    if (aiResponse != null) {
      return aiResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AiResponseImplToJson(
      this,
    );
  }
}

abstract class AiResponse implements ResponseModel {
  const factory AiResponse(
      {required final String imageUrl,
      required final String title,
      required final String subTitle}) = _$AiResponseImpl;

  factory AiResponse.fromJson(Map<String, dynamic> json) =
      _$AiResponseImpl.fromJson;

  String get imageUrl;
  String get title;
  String get subTitle;
  @JsonKey(ignore: true)
  _$$AiResponseImplCopyWith<_$AiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserResponseImplCopyWith<$Res> {
  factory _$$UserResponseImplCopyWith(
          _$UserResponseImpl value, $Res Function(_$UserResponseImpl) then) =
      __$$UserResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sendMessage});
}

/// @nodoc
class __$$UserResponseImplCopyWithImpl<$Res>
    extends _$ResponseModelCopyWithImpl<$Res, _$UserResponseImpl>
    implements _$$UserResponseImplCopyWith<$Res> {
  __$$UserResponseImplCopyWithImpl(
      _$UserResponseImpl _value, $Res Function(_$UserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendMessage = null,
  }) {
    return _then(_$UserResponseImpl(
      sendMessage: null == sendMessage
          ? _value.sendMessage
          : sendMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseImpl implements UserResponse {
  const _$UserResponseImpl({required this.sendMessage, final String? $type})
      : $type = $type ?? 'userResponse';

  factory _$UserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseImplFromJson(json);

  @override
  final String sendMessage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResponseModel.userResponse(sendMessage: $sendMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseImpl &&
            (identical(other.sendMessage, sendMessage) ||
                other.sendMessage == sendMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sendMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      __$$UserResponseImplCopyWithImpl<_$UserResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String title, String subTitle)
        aiResponse,
    required TResult Function(String sendMessage) userResponse,
  }) {
    return userResponse(sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imageUrl, String title, String subTitle)?
        aiResponse,
    TResult? Function(String sendMessage)? userResponse,
  }) {
    return userResponse?.call(sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String title, String subTitle)?
        aiResponse,
    TResult Function(String sendMessage)? userResponse,
    required TResult orElse(),
  }) {
    if (userResponse != null) {
      return userResponse(sendMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiResponse value) aiResponse,
    required TResult Function(UserResponse value) userResponse,
  }) {
    return userResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiResponse value)? aiResponse,
    TResult? Function(UserResponse value)? userResponse,
  }) {
    return userResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiResponse value)? aiResponse,
    TResult Function(UserResponse value)? userResponse,
    required TResult orElse(),
  }) {
    if (userResponse != null) {
      return userResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseImplToJson(
      this,
    );
  }
}

abstract class UserResponse implements ResponseModel {
  const factory UserResponse({required final String sendMessage}) =
      _$UserResponseImpl;

  factory UserResponse.fromJson(Map<String, dynamic> json) =
      _$UserResponseImpl.fromJson;

  String get sendMessage;
  @JsonKey(ignore: true)
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
