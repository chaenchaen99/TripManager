import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/shared/text_widgets.dart';
import 'package:trip_manager/views/auth/signup/providers/email_verification.dart';
import 'package:trip_manager/views/auth/signup/providers/password_verification.dart';

import '../../../theme.dart';
import '../start/widgets/custom_button.dart';
import 'widgets/custom_bottom_btn.dart';
import 'widgets/custom_password_textformfield copy.dart';

class ThirdSignupPage extends ConsumerStatefulWidget {
  const ThirdSignupPage({super.key});

  @override
  ConsumerState<ThirdSignupPage> createState() => _ThirdSignupPageState();
}

class _ThirdSignupPageState extends ConsumerState<ThirdSignupPage> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  late FocusNode _newPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    final _passwordVerificationState = ref.read(passwordVerificationProvider);
    _newPasswordController =
        TextEditingController(text: _passwordVerificationState.newPassword);
    _confirmPasswordController =
        TextEditingController(text: _passwordVerificationState.confirmPassword);
    _newPasswordFocusNode = FocusNode();

    // 화면이 로드될 때 첫 번째 텍스트 필드에 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_newPasswordFocusNode);

      //포커스를 설정하고 유효성 검사를 트리거
      // ref.read(passwordVerificationProvider.notifier).newPasswordValidator('');
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    final _passwordVerifiState = ref.watch(passwordVerificationProvider);
    final _passwordVerificationNotifier =
        ref.watch(passwordVerificationProvider.notifier);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '비밀번호를 입력해주세요.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              text14Normal(text: '이메일 아이디'),
              text16Normal(
                  text: ref.read(emailVerificationProvider).email,
                  weight: FontWeight.w600),
              SizedBox(height: 40),
              CustomPasswordTextFormField(
                controller: _newPasswordController,
                title: '비밀번호',
                focusNode: _newPasswordFocusNode,
                hintText: '비밀번호를 입력해주세요',
                onChanged: (value) {
                  _passwordVerificationNotifier.newPasswordValidator(value);
                },
                validationItems: [
                  ValidationItem('영문,숫자,특수문자 포함',
                      _passwordVerifiState.hasSpecialConditions),
                  ValidationItem('8자리 이상', _passwordVerifiState.isLengthValid),
                ],
              ),
              const SizedBox(height: 40),
              CustomPasswordTextFormField(
                controller: _confirmPasswordController,
                title: '비밀번호 확인',
                hintText: '비밀번호를 한번 더 입력해주세요',
                onChanged: (value) {
                  _passwordVerificationNotifier.confirmPasswordValidator(value);
                },
                validationItems: [
                  ValidationItem(
                      '비밀번호 일치', _passwordVerifiState.doPasswordMatch),
                ],
              ),
              SizedBox(height: 300),
            ],
          ),
        ),
      ),
      bottomSheet: CustomBottomBtn(
        isKeyboardVisible: isKeyboardVisible,
        isEnabled: _passwordVerificationNotifier.formValidator(),
      ),
    );
  }
}
