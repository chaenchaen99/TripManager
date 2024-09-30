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
}
