import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_verification.freezed.dart';
part 'email_verification.g.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState({
    required String email,
    required String verificationCode,
    required bool isLoading,
    String? errorMessage,
  }) = _EmailVerificationState;

  factory EmailVerificationState.initial() => const EmailVerificationState(
        email: '',
        verificationCode: '',
        isLoading: false,
        errorMessage: null,
      );
}

@riverpod
class EmailVerification extends _$EmailVerification {
  @override
  EmailVerificationState build() {
    return EmailVerificationState.initial();
  }

  String? emailValidator(String? email) {
    // 이메일 유효성 검사
    if (email == null || email.isEmpty) {
      return '이메일을 입력해주세요.';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email)) {
      return '이메일 형식이 맞지 않습니다.';
    }
    return null;
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setVerificationCode(String code) {
    state = state.copyWith(verificationCode: code);
  }

  Future<void> sendVerificationEmail() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      //TODO: 이메일 인증 API 호출 코드 추가
    } catch (error) {
      state = state.copyWith(errorMessage: '이메일 전송 실패');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> verifyCode() async {
    if (state.verificationCode.isEmpty) {
      state = state.copyWith(errorMessage: '인증번호를 입력해주세요.');
      return;
    }
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      //여기에 인증 번호 확인 API 호출 코드 추가
      await Future.delayed(const Duration(seconds: 2));
    } catch (error) {
      state = state.copyWith(errorMessage: '잘못된 인증번호입니다.');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
