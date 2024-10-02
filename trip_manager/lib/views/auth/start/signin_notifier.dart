import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_manager/models/user/user_profile.dart';

part 'signin_notifier.g.dart';

@riverpod
class SigninNotifier extends _$SigninNotifier {
  @override
  UserProfile? build() {
    return null;
  }

  void setUserProfile(UserProfile? profile) {
    state = profile;
  }

  void clearUserProfile() {
    state = null;
  }
}
