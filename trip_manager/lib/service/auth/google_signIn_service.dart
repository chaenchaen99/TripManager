import 'package:google_sign_in/google_sign_in.dart';
import 'package:trip_manager/models/auth/user_profile.dart';

class GoogleSigninService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'https://www.googleapis.com/auth/userinfo.profile'],
  );

  Future<UserProfile?> signIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final idToken = googleAuth.idToken;

        return UserProfile.fromGoogleSignInAccount(googleUser, idToken);
      }
      return null;
    } catch (error) {
      print('Google Sign-In Error: $error');
      return null;
    }
  }

  Future<void> signOut() => _googleSignIn.signOut();
}
