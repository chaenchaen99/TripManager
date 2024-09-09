import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/config/router/router_names.dart';
import 'package:trip_manager/views/auth/signup/providers/second_step_signup.dart';
import 'package:trip_manager/views/auth/signup/widgets/custom_bottom_btn.dart';
import '../../../shared/toast.dart';
import 'widgets/custom_email_textformfield.dart';
import 'widgets/custom_code_textformfield.dart';

class SecondStepSignupPage extends ConsumerStatefulWidget {
  const SecondStepSignupPage({super.key});

  @override
  ConsumerState<SecondStepSignupPage> createState() => _SecondSignupPageState();
}

class _SecondSignupPageState extends ConsumerState<SecondStepSignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _verifiCodelController = TextEditingController();
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    final _emailVerificationState = ref.read(secondStepSignupProvider);
    _emailController =
        TextEditingController(text: _emailVerificationState.email);
    _verifiCodelController =
        TextEditingController(text: _emailVerificationState.verificationCode);
    _emailFocusNode = FocusNode();

    // 화면이 로드될 때 첫 번째 텍스트 필드에 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_emailFocusNode);

      //포커스를 설정하고 유효성 검사를 트리거
      ref.read(secondStepSignupProvider.notifier).emailValidator('');
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
    final _emailVerificationState = ref.watch(secondStepSignupProvider);
    final _emailVerificationNotifier =
        ref.watch(secondStepSignupProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
            context.pop();
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
            CustomEmailTextFormField(
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
                verifiBtnText: _emailVerificationState.verifyBtnText,
                verifiBtnClicked: () {
                  //인증버튼 클릭시
                  _verifiCodelController.clear();
                  _emailVerificationNotifier.sendVerificationEmail();
                  toast(
                    context,
                    '인증 메일이 전송되었습니다.',
                  );
                }),
            const SizedBox(height: 40),
            CustomCodeTextFormField(
              controller: _verifiCodelController,
              title: '인증번호',
              hintText: '인증번호 6자리',
              errorMsg: _emailVerificationState.codeErrorMsg,
              onChanged: (value) {
                _emailVerificationNotifier.codeValidator(value);
              },
              isTimerRunning: _emailVerificationState.countdown != 0,
            ),
          ],
        ),
      ),
      bottomSheet: CustomBottomBtn(
        isKeyboardVisible: isKeyboardVisible,
        isEnabled: _emailVerificationNotifier.formValidator(),
        onPressed: () => context.pushNamed(RouteNames.passsword),
      ),
    );
  }
}
