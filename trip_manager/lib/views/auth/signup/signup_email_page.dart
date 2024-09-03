import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    final emailVerificationState = ref.read(emailVerificationProvider);
    _emailController =
        TextEditingController(text: emailVerificationState.email);
    _verifiCodelController =
        TextEditingController(text: emailVerificationState.verificationCode);
    _emailFocusNode = FocusNode();

    // 화면이 로드될 때 첫 번째 텍스트 필드에 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_emailFocusNode);

      //포커스를 설정하고 유효성 검사를 트리거
      ref.read(emailVerificationProvider.notifier).emailValidator('');
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _verifiCodelController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    final _emailVerificationState = ref.watch(emailVerificationProvider);
    final _emailVerificationNotifier =
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
                focusNode: _emailFocusNode,
                hintText: 'abc@email.com',
                onChanged: (value) {
                  _emailVerificationNotifier.emailValidator(value);
                },
                isButtonEnabled: _emailVerificationState.emailErrorMsg == null
                    ? true
                    : false,
                verifiBtnText: '인증받기',
                verifiBtnClicked: () {}),
            const SizedBox(height: 40),
            CustomTextFormField(
              controller: _verifiCodelController,
              title: '인증번호',
              hintText: '인증번호 6자리',
              errorMsg: _emailVerificationState.codeErrorMsg,
              onChanged: (value) {
                _emailVerificationNotifier.codeValidator(value);
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(
            left: 18, right: 18, bottom: isKeyboardVisible ? 12 : 48),
        color: Colors.white, // BottomSheet 색상 변경
        child: CustomButton(
          text: '다음',
          backgroundColor: AppColors.mainColor,
          fontColor: Colors.white,
          isEnabled: _emailVerificationState.emailErrorMsg == null &&
              _emailVerificationState.codeErrorMsg == null,
          onPressed: () {},
        ),
      ),
    );
  }
}
