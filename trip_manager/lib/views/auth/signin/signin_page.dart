import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/views/auth/start/widgets/custom_button.dart';
import '../../../config/router/router_names.dart';
import '../../../theme.dart';
import 'widgets/custom_textformfield.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateFormStatus);
    passwordController.addListener(_updateFormStatus);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _updateFormStatus() {
    final emailValid = emailController.text.isNotEmpty;
    final passwordValid = passwordController.text.isNotEmpty;
    setState(() {
      isFormValid = emailValid && passwordValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
            context.goNamed(RouteNames.start);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '로그인',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              controller: emailController,
              title: '이메일',
              hintText: 'abc@email.com',
              onChanged: (value) {
                _updateFormStatus();
              },
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              controller: passwordController,
              title: '비밀번호',
              hintText: '영문,숫자,특수문자',
              onChanged: (value) {
                _updateFormStatus();
              },
            ),
            const SizedBox(height: 28),
            CustomButton(
              text: '로그인',
              backgroundColor: isFormValid
                  ? AppColors.mainColor
                  : AppColors.mainColor.withAlpha(80),
              fontColor: Colors.white,
              onPressed: isFormValid
                  ? () {
                      // Handle login logic
                      //틀린 계정이라면
                      // toast(
                      //   context,
                      //   '가입되지 않은 계정입니다.',
                      // );
                      context.goNamed(RouteNames.home);
                    }
                  : null,
            ),
            const SizedBox(height: 14),
            const FindAccountWidget(),
            const GoSignupWidget()
          ],
        ),
      ),
    );
  }
}

class GoSignupWidget extends StatelessWidget {
  const GoSignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '아직 회원이 아니신가요?',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.lightColor_4),
        ),
        SizedBox(width: 12),
        Text(
          '회원가입 하기',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.darkColor_1),
        ),
        SizedBox(width: 4),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
        ),
      ],
    );
  }
}

class FindAccountWidget extends StatelessWidget {
  const FindAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '계정찾기',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.darkColor_1),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
          ),
        ],
      ),
    );
  }
}
