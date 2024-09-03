import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/views/auth/signup/providers/email_verification.dart';
import 'package:trip_manager/views/auth/signup/widgets/custom_verifi_textformfield.dart';

import '../../../theme.dart';
import '../signin/widgets/custom_textformfield.dart';
import '../start/widgets/custom_button.dart';

class SignupEmailPage extends ConsumerStatefulWidget {
  const SignupEmailPage({super.key});

  @override
  ConsumerState<SignupEmailPage> createState() => _SignupEmailPageState();
}

class _SignupEmailPageState extends ConsumerState<SignupEmailPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _verifiCodelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final emailVerificationState = ref.read(emailVerificationProvider);
    _emailController =
        TextEditingController(text: emailVerificationState.email);
    _verifiCodelController =
        TextEditingController(text: emailVerificationState.verificationCode);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _verifiCodelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailVerificationState = ref.watch(emailVerificationProvider);
    final emailVerificationNotifier =
        ref.watch(emailVerificationProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '이메일 인증을 해주세요.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            CustomVerifiTextFormField(
              controller: _emailController,
              title: '이메일',
              hintText: 'abc@email.com',
              // onChanged: (value) {
              //   emailVerificationNotifier.setEmail(value);
              // },
              verifiBtnText: '인증받기',
              verifiBtnClicked: () {},
              verifyValidator: (value) {
                print(value);
                print(emailVerificationNotifier.emailValidator(value));
                return emailVerificationNotifier.emailValidator(value);
              },
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              controller: _verifiCodelController,
              title: '인증번호',
              hintText: '인증번호 6자리',
              onChanged: (value) {
                emailVerificationNotifier.setVerificationCode(value);
              },
            ),
            CustomButton(
                text: '다음',
                backgroundColor: AppColors.mainColor,
                fontColor: Colors.white,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
