// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'third_step_signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PasswordVerifiState {
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  bool get hasSpecialConditions => throw _privateConstructorUsedError;
  bool get isLengthValid => throw _privateConstructorUsedError;
  bool get doPasswordMatch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordVerifiStateCopyWith<PasswordVerifiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordVerifiStateCopyWith<$Res> {
  factory $PasswordVerifiStateCopyWith(
          PasswordVerifiState value, $Res Function(PasswordVerifiState) then) =
      _$PasswordVerifiStateCopyWithImpl<$Res, PasswordVerifiState>;
  @useResult
  $Res call(
      {String newPassword,
      String confirmPassword,
      bool hasSpecialConditions,
      bool isLengthValid,
      bool doPasswordMatch});
}

/// @nodoc
class _$PasswordVerifiStateCopyWithImpl<$Res, $Val extends PasswordVerifiState>
    implements $PasswordVerifiStateCopyWith<$Res> {
  _$PasswordVerifiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? hasSpecialConditions = null,
    Object? isLengthValid = null,
    Object? doPasswordMatch = null,
  }) {
    return _then(_value.copyWith(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hasSpecialConditions: null == hasSpecialConditions
          ? _value.hasSpecialConditions
          : hasSpecialConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      isLengthValid: null == isLengthValid
          ? _value.isLengthValid
          : isLengthValid // ignore: cast_nullable_to_non_nullable
              as bool,
      doPasswordMatch: null == doPasswordMatch
          ? _value.doPasswordMatch
          : doPasswordMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordVerifiStateImplCopyWith<$Res>
    implements $PasswordVerifiStateCopyWith<$Res> {
  factory _$$PasswordVerifiStateImplCopyWith(_$PasswordVerifiStateImpl value,
          $Res Function(_$PasswordVerifiStateImpl) then) =
      __$$PasswordVerifiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String newPassword,
      String confirmPassword,
      bool hasSpecialConditions,
      bool isLengthValid,
      bool doPasswordMatch});
}

/// @nodoc
class __$$PasswordVerifiStateImplCopyWithImpl<$Res>
    extends _$PasswordVerifiStateCopyWithImpl<$Res, _$PasswordVerifiStateImpl>
    implements _$$PasswordVerifiStateImplCopyWith<$Res> {
  __$$PasswordVerifiStateImplCopyWithImpl(_$PasswordVerifiStateImpl _value,
      $Res Function(_$PasswordVerifiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? hasSpecialConditions = null,
    Object? isLengthValid = null,
    Object? doPasswordMatch = null,
  }) {
    return _then(_$PasswordVerifiStateImpl(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hasSpecialConditions: null == hasSpecialConditions
          ? _value.hasSpecialConditions
          : hasSpecialConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      isLengthValid: null == isLengthValid
          ? _value.isLengthValid
          : isLengthValid // ignore: cast_nullable_to_non_nullable
              as bool,
      doPasswordMatch: null == doPasswordMatch
          ? _value.doPasswordMatch
          : doPasswordMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PasswordVerifiStateImpl implements _PasswordVerifiState {
  const _$PasswordVerifiStateImpl(
      {required this.newPassword,
      required this.confirmPassword,
      this.hasSpecialConditions = false,
      this.isLengthValid = false,
      this.doPasswordMatch = false});

  @override
  final String newPassword;
  @override
  final String confirmPassword;
  @override
  @JsonKey()
  final bool hasSpecialConditions;
  @override
  @JsonKey()
  final bool isLengthValid;
  @override
  @JsonKey()
  final bool doPasswordMatch;

  @override
  String toString() {
    return 'PasswordVerifiState(newPassword: $newPassword, confirmPassword: $confirmPassword, hasSpecialConditions: $hasSpecialConditions, isLengthValid: $isLengthValid, doPasswordMatch: $doPasswordMatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordVerifiStateImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.hasSpecialConditions, hasSpecialConditions) ||
                other.hasSpecialConditions == hasSpecialConditions) &&
            (identical(other.isLengthValid, isLengthValid) ||
                other.isLengthValid == isLengthValid) &&
            (identical(other.doPasswordMatch, doPasswordMatch) ||
                other.doPasswordMatch == doPasswordMatch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPassword, confirmPassword,
      hasSpecialConditions, isLengthValid, doPasswordMatch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordVerifiStateImplCopyWith<_$PasswordVerifiStateImpl> get copyWith =>
      __$$PasswordVerifiStateImplCopyWithImpl<_$PasswordVerifiStateImpl>(
          this, _$identity);
}

abstract class _PasswordVerifiState implements PasswordVerifiState {
  const factory _PasswordVerifiState(
      {required final String newPassword,
      required final String confirmPassword,
      final bool hasSpecialConditions,
      final bool isLengthValid,
      final bool doPasswordMatch}) = _$PasswordVerifiStateImpl;

  @override
  String get newPassword;
  @override
  String get confirmPassword;
  @override
  bool get hasSpecialConditions;
  @override
  bool get isLengthValid;
  @override
  bool get doPasswordMatch;
  @override
  @JsonKey(ignore: true)
  _$$PasswordVerifiStateImplCopyWith<_$PasswordVerifiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
