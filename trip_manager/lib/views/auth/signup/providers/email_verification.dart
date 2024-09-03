import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_manager/shared/utils.dart';

part 'email_verification.freezed.dart';
part 'email_verification.g.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState({
    required String email,
    required String verificationCode,
    required String countdown,
    String? emailErrorMsg,
    String? codeErrorMsg,
  }) = _EmailVerificationState;

  factory EmailVerificationState.initial() => const EmailVerificationState(
        email: '',
        verificationCode: '',
        countdown: '',
        emailErrorMsg: null,
        codeErrorMsg: null,
      );
}

@riverpod
class EmailVerification extends _$EmailVerification {
  Timer? _timer;

  @override
  EmailVerificationState build() {
    return EmailVerificationState.initial();
  }

  //이메일 유효성 검사
  void emailValidator(String? email) {
    // 이메일 유효성 검사
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email == null || email.isEmpty) {
      state = state.copyWith(emailErrorMsg: '이메일을 입력해주세요');
    } else if (!emailRegex.hasMatch(email)) {
      state = state.copyWith(emailErrorMsg: '이메일 형식에 맞지 않습니다');
    } else {
      state = state.copyWith(email: email, emailErrorMsg: null);
    }
  }

  //인증번호 유효성 검사
  void codeValidator(String? code) {
    if (code == null || code.isEmpty) {
      state = state.copyWith(codeErrorMsg: '인증번호를 입력해주세요.');
    } else if (code.trim().length != 6) {
      state = state.copyWith(codeErrorMsg: '인증번호는 6자리입니다.');
    } else {
      state = state.copyWith(verificationCode: code, codeErrorMsg: null);
    }
  }

  //이메일 인증 API 호출
  Future<void> sendVerificationEmail() async {
    state = state.copyWith(emailErrorMsg: null);
    try {
      //TODO: 이메일 인증 API 호출 코드 추가
      startCountdown();
    } catch (error) {
      state = state.copyWith(emailErrorMsg: '이메일 전송 실패');
    }
  }

  //인증번호 인증 API 호출
  Future<void> verifyCode(String code) async {
    state = state.copyWith(verificationCode: code, codeErrorMsg: null);
    try {
      //여기에 인증 번호 확인 API 호출 코드 추가
      await Future.delayed(const Duration(seconds: 2));
    } catch (error) {
      state = state.copyWith(emailErrorMsg: '잘못된 인증번호입니다.');
    }
  }

  //인증번호 유효시간 3분 타이머
  void startCountdown() {
    _timer?.cancel();

    int countdownSeconds = 180;
    // String formattedTime = formatTime(countdownSeconds);

    // state = state.copyWith(countdown: formattedTime);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownSeconds > 0) {
        countdownSeconds--;
        state = state.copyWith(countdown: formatTime(countdownSeconds));
      } else {
        timer.cancel();
        state = state.copyWith(codeErrorMsg: '인증 시간이 만료되었습니다.');
      }
    });
  }
}
