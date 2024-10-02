import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:trip_manager/models/auth/user_profile.dart';

class KakaoSignInService {
  Future<UserProfile?> signIn() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      // 카카오톡 앱이 설치되어 있을 경우, 카카오톡을 통해 로그인 시도
      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      // 사용자 정보 요청
      User user = await UserApi.instance.me();

      return UserProfile.fromKakaoAccount(user, token.idToken!);
    } catch (error) {
      print('Kakao Sign-In Error: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await UserApi.instance.logout();
      print('Kakao logout successful');
    } catch (error) {
      print('Kakao logout error: $error');
    }
  }
}
