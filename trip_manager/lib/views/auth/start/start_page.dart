import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/const/constants.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/auth/start/widgets/sso_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
  const AccountWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            '회원가입',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        const Text(
          '|',
          style: TextStyle(color: Color(0xffBBBEC7)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            '회원가입',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class SSOLoginWidgets extends StatelessWidget {
  const SSOLoginWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SSOButton(
            icon: Image.asset(
              'assets/icons/kakao_logo.png',
              width: 20,
              height: 20,
            ),
            text: '카카오로 로그인',
            backgroundColor: AppColors.kakaoMainColor,
            fontColor: Colors.black,
            onPressed: () {}),
        const SizedBox(height: 12),
        SSOButton(
            icon: Image.asset(
              'assets/icons/naver_logo.png',
              width: 20,
              height: 20,
            ),
            text: '네이버로 로그인',
            backgroundColor: AppColors.naverMainColor,
            fontColor: Colors.white,
            onPressed: () {}),
        const SizedBox(height: 12),
        SSOButton(
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
        SSOButton(
            icon: Image.asset(
              'assets/icons/mail_logo.png',
              width: 20,
              height: 20,
            ),
            text: '이메일로 로그인',
            backgroundColor: Colors.white,
            outlineColor: AppColors.emailOutlineCOlor,
            fontColor: Colors.black,
            onPressed: () {
              context.go('/signin');
            }),
      ],
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
