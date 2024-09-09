import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'third_step_signup.freezed.dart';
part 'third_step_signup.g.dart';

@freezed
class PasswordVerifiState with _$PasswordVerifiState {
  const factory PasswordVerifiState({
    required String newPassword,
    required String confirmPassword,
    @Default(false) bool hasSpecialConditions,
    @Default(false) bool isLengthValid,
    @Default(false) bool doPasswordMatch,
  }) = _PasswordVerifiState;
}

@riverpod
class ThirdStepSignup extends _$ThirdStepSignup {
  @override
  PasswordVerifiState build() {
    return const PasswordVerifiState(
      newPassword: '',
      confirmPassword: '',
    );
  }

  //비밀번호 유효성 검사
  void newPasswordValidator(String value) {
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool isLengthValid = value.length >= 8;

    state = state.copyWith(
      newPassword: value,
      hasSpecialConditions: hasUppercase && hasSpecialCharacters && hasDigits,
      isLengthValid: isLengthValid,
    );
  }

  //비밀번호 확인 유효성 검사
  void confirmPasswordValidator(String value) {
    state = state.copyWith(
      confirmPassword: value,
      doPasswordMatch: value.trim() == state.newPassword.trim(),
    );
  }

  //폼 유효성 검사
  bool formValidator() {
    if (state.doPasswordMatch && state.hasSpecialConditions) {
      return true;
    } else {
      return false;
    }
  }
}
