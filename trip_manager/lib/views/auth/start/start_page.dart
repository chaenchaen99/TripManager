import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/service/auth/google_signIn_service.dart';
import 'package:trip_manager/service/auth/kakao_signIn_service.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/auth/start/signin_notifier.dart';
import 'package:trip_manager/views/auth/start/widgets/custom_button.dart';

import '../../../config/router/router_names.dart';
import '../../../shared/text_widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StartHeaderWidget(),
          SizedBox(
            height: 60,
          ),
          SSOLoginWidgets(),
          SizedBox(height: 24),
          AccountWidgets(),
        ],
      ),
    );
  }
}

class AccountWidgets extends StatelessWidget {
  AccountWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => context.pushNamed(RouteNames.signup),
          child: text14Normal(text: "이메일 회원가입"),
        ),
        const Text(
          '|',
          style: TextStyle(color: Color(0xffBBBEC7)),
        ),
        TextButton(
          onPressed: () {},
          child: text14Normal(text: "계정변경"),
        ),
      ],
    );
  }
}

class SSOLoginWidgets extends ConsumerWidget {
  final GoogleSigninService _googleSigninService = GoogleSigninService();
  final KakaoSignInService _kakaoSigninService = KakaoSignInService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        children: [
          CustomButton(
              icon: Image.asset(
                'assets/icons/kakao_logo.png',
                width: 20,
                height: 20,
              ),
              text: '카카오로 로그인',
              backgroundColor: AppColors.kakaoMainColor,
              fontColor: Colors.black,
              onPressed: () async {
                final userProfile = await _kakaoSigninService.signIn();
                if (userProfile != null) {
                  ref
                      .read(signinNotifierProvider.notifier)
                      .setUserProfile(userProfile);

                  //debug 확인용
                  print(
                      'Logged in: ${userProfile.displayName} | ${userProfile.photoUrl} | ${userProfile.idToken}');
                } else {
                  print("Login failed");
                }

                context.goNamed(RouteNames.home);
              }),
          const SizedBox(height: 12),
          CustomButton(
              icon: Image.asset(
                'assets/icons/apple_logo.png',
                width: 20,
                height: 20,
              ),
              text: 'Apple로 로그인',
              backgroundColor: AppColors.appleMainColor,
              fontColor: Colors.white,
              onPressed: () {}),
          const SizedBox(height: 12),
          CustomButton(
              icon: Image.asset(
                'assets/icons/google_logo.png',
                width: 20,
                height: 20,
              ),
              text: '구글 로그인',
              backgroundColor: Colors.white,
              outlineColor: AppColors.emailOutlineColor,
              fontColor: Colors.black,
              onPressed: () async {
                final userProfile = await _googleSigninService.signIn();

                if (userProfile != null) {
                  ref
                      .read(signinNotifierProvider.notifier)
                      .setUserProfile(userProfile);

                  //debug 확인용
                  print(
                      'Logged in: ${userProfile.displayName} | ${userProfile.email}');
                  // Split the token into chunks of 800 characters and print each chunk
                  final int chunkSize = 800;
                  for (var i = 0;
                      i < userProfile.idToken.length;
                      i += chunkSize) {
                    print(userProfile.idToken.substring(
                        i,
                        i + chunkSize > userProfile.idToken.length
                            ? userProfile.idToken.length
                            : i + chunkSize));
                  }
                } else {
                  print('Login failed');
                }

                context.goNamed(RouteNames.home);
              }),
          const SizedBox(height: 12),
          CustomButton(
              icon: Image.asset(
                'assets/icons/mail_logo.png',
                width: 20,
                height: 20,
              ),
              text: '이메일로 로그인',
              backgroundColor: Colors.white,
              outlineColor: AppColors.emailOutlineColor,
              fontColor: Colors.black,
              onPressed: () {
                context.pushNamed(RouteNames.signin);
              }),
        ],
      ),
    );
  }
}

class StartHeaderWidget extends StatelessWidget {
  const StartHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 380,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/test/test_img_1.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          bottom: -1,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.white.withOpacity(1.0), // 하단에 진한 검정색
                  Colors.transparent, // 중간으로 갈수록 투명
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Image.asset(
              'assets/icons/trip_manager_white.png',
              width: 198,
              height: 34,
            ),
          ),
        ),
      ],
    );
  }
}
