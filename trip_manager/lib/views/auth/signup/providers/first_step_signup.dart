import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'first_step_signup.g.dart';

class TermCheckboxState {
  final bool isTermsAccepted;
  final bool isPrivacyAccepted;

  TermCheckboxState({
    required this.isTermsAccepted,
    required this.isPrivacyAccepted,
  });

  TermCheckboxState copyWith({
    bool? isTermsAccepted,
    bool? isPrivacyAccepted,
  }) {
    return TermCheckboxState(
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
      isPrivacyAccepted: isPrivacyAccepted ?? this.isPrivacyAccepted,
    );
  }
}

@riverpod
class FirstStepSignup extends _$FirstStepSignup {
  @override
  TermCheckboxState build() {
    return TermCheckboxState(
      isTermsAccepted: false,
      isPrivacyAccepted: false,
    );
  }

  void toggleTerms() {
    state = state.copyWith(isTermsAccepted: !state.isTermsAccepted);
  }

  void togglePrivacy() {
    state = state.copyWith(isPrivacyAccepted: !state.isPrivacyAccepted);
  }

  void toggleAll(bool value) {
    state = state.copyWith(
      isTermsAccepted: value,
      isPrivacyAccepted: value,
    );
  }
}
