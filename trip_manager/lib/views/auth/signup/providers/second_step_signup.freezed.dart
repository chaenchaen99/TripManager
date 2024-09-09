// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'second_step_signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmailVerificationState {
  String get email => throw _privateConstructorUsedError;
  String get verificationCode => throw _privateConstructorUsedError;
  String get countdown => throw _privateConstructorUsedError;
  String? get emailErrorMsg => throw _privateConstructorUsedError;
  String? get codeErrorMsg => throw _privateConstructorUsedError;
  String? get verifyBtnText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailVerificationStateCopyWith<EmailVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationStateCopyWith<$Res> {
  factory $EmailVerificationStateCopyWith(EmailVerificationState value,
          $Res Function(EmailVerificationState) then) =
      _$EmailVerificationStateCopyWithImpl<$Res, EmailVerificationState>;
  @useResult
  $Res call(
      {String email,
      String verificationCode,
      String countdown,
      String? emailErrorMsg,
      String? codeErrorMsg,
      String? verifyBtnText});
}

/// @nodoc
class _$EmailVerificationStateCopyWithImpl<$Res,
        $Val extends EmailVerificationState>
    implements $EmailVerificationStateCopyWith<$Res> {
  _$EmailVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? verificationCode = null,
    Object? countdown = null,
    Object? emailErrorMsg = freezed,
    Object? codeErrorMsg = freezed,
    Object? verifyBtnText = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      countdown: null == countdown
          ? _value.countdown
          : countdown // ignore: cast_nullable_to_non_nullable
              as String,
      emailErrorMsg: freezed == emailErrorMsg
          ? _value.emailErrorMsg
          : emailErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      codeErrorMsg: freezed == codeErrorMsg
          ? _value.codeErrorMsg
          : codeErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      verifyBtnText: freezed == verifyBtnText
          ? _value.verifyBtnText
          : verifyBtnText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationStateImplCopyWith<$Res>
    implements $EmailVerificationStateCopyWith<$Res> {
  factory _$$EmailVerificationStateImplCopyWith(
          _$EmailVerificationStateImpl value,
          $Res Function(_$EmailVerificationStateImpl) then) =
      __$$EmailVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String verificationCode,
      String countdown,
      String? emailErrorMsg,
      String? codeErrorMsg,
      String? verifyBtnText});
}

/// @nodoc
class __$$EmailVerificationStateImplCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res,
        _$EmailVerificationStateImpl>
    implements _$$EmailVerificationStateImplCopyWith<$Res> {
  __$$EmailVerificationStateImplCopyWithImpl(
      _$EmailVerificationStateImpl _value,
      $Res Function(_$EmailVerificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? verificationCode = null,
    Object? countdown = null,
    Object? emailErrorMsg = freezed,
    Object? codeErrorMsg = freezed,
    Object? verifyBtnText = freezed,
  }) {
    return _then(_$EmailVerificationStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      countdown: null == countdown
          ? _value.countdown
          : countdown // ignore: cast_nullable_to_non_nullable
              as String,
      emailErrorMsg: freezed == emailErrorMsg
          ? _value.emailErrorMsg
          : emailErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      codeErrorMsg: freezed == codeErrorMsg
          ? _value.codeErrorMsg
          : codeErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      verifyBtnText: freezed == verifyBtnText
          ? _value.verifyBtnText
          : verifyBtnText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmailVerificationStateImpl implements _EmailVerificationState {
  const _$EmailVerificationStateImpl(
      {required this.email,
      required this.verificationCode,
      required this.countdown,
      this.emailErrorMsg,
      this.codeErrorMsg,
      this.verifyBtnText});

  @override
  final String email;
  @override
  final String verificationCode;
  @override
  final String countdown;
  @override
  final String? emailErrorMsg;
  @override
  final String? codeErrorMsg;
  @override
  final String? verifyBtnText;

  @override
  String toString() {
    return 'EmailVerificationState(email: $email, verificationCode: $verificationCode, countdown: $countdown, emailErrorMsg: $emailErrorMsg, codeErrorMsg: $codeErrorMsg, verifyBtnText: $verifyBtnText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.countdown, countdown) ||
                other.countdown == countdown) &&
            (identical(other.emailErrorMsg, emailErrorMsg) ||
                other.emailErrorMsg == emailErrorMsg) &&
            (identical(other.codeErrorMsg, codeErrorMsg) ||
                other.codeErrorMsg == codeErrorMsg) &&
            (identical(other.verifyBtnText, verifyBtnText) ||
                other.verifyBtnText == verifyBtnText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, verificationCode,
      countdown, emailErrorMsg, codeErrorMsg, verifyBtnText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationStateImplCopyWith<_$EmailVerificationStateImpl>
      get copyWith => __$$EmailVerificationStateImplCopyWithImpl<
          _$EmailVerificationStateImpl>(this, _$identity);
}

abstract class _EmailVerificationState implements EmailVerificationState {
  const factory _EmailVerificationState(
      {required final String email,
      required final String verificationCode,
      required final String countdown,
      final String? emailErrorMsg,
      final String? codeErrorMsg,
      final String? verifyBtnText}) = _$EmailVerificationStateImpl;

  @override
  String get email;
  @override
  String get verificationCode;
  @override
  String get countdown;
  @override
  String? get emailErrorMsg;
  @override
  String? get codeErrorMsg;
  @override
  String? get verifyBtnText;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationStateImplCopyWith<_$EmailVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
