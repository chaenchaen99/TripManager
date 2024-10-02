import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class UserProfile {
  final String displayName;
  final String email;
  final String photoUrl;
  final String id;
  final String idToken;

  UserProfile({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.id,
    required this.idToken,
  });

  factory UserProfile.fromGoogleSignInAccount(googleUser, idToken) {
    return UserProfile(
      displayName: googleUser.displayName ?? '',
      email: googleUser.email,
      photoUrl: googleUser.photoUrl ?? '',
      id: googleUser.id,
      idToken: idToken ?? '',
    );
  }

  factory UserProfile.fromKakaoAccount(User user, String accessToken) {
    return UserProfile(
      displayName: user.kakaoAccount?.profile?.nickname ?? 'Unknown',
      email: user.kakaoAccount?.email ?? 'Unknown',
      photoUrl: user.kakaoAccount?.profile?.profileImageUrl ?? '',
      id: '',
      idToken: accessToken,
    );
  }
}
