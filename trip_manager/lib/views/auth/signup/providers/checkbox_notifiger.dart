import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkbox_notifiger.g.dart';

class CheckboxState {
  final bool isTermsAccepted;
  final bool isPrivacyAccepted;

  CheckboxState({
    required this.isTermsAccepted,
    required this.isPrivacyAccepted,
  });

  CheckboxState copyWith({
    bool? isTermsAccepted,
    bool? isPrivacyAccepted,
  }) {
    return CheckboxState(
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
      isPrivacyAccepted: isPrivacyAccepted ?? this.isPrivacyAccepted,
    );
  }
}

@riverpod
class CheckboxNotifiger extends _$CheckboxNotifiger {
  @override
  CheckboxState build() {
    return CheckboxState(
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
