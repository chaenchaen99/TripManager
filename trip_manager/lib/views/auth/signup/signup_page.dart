import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/shared/custom_widgets.dart';
import 'package:trip_manager/views/auth/signup/providers/checkbox_notifiger.dart';
import 'package:trip_manager/views/auth/signup/providers/term_checkbox.dart';

import '../../../theme.dart';
import 'widgets/custom_checkbox.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const SignupBgWidget(),
            DraggableScrollableSheet(
              // 화면 비율로 높이 조정
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 32),
                    height: 1500,
                    decoration: boxRadius25(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "서비스 이용약관에 동의해주세요",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TermsOfUseCheckBox(
                          contents: '(필수) 이용약관',
                          toggleCallback: ref
                              .read(checkboxNotifigerProvider.notifier)
                              .toggleTerms,
                          isChecked: ref
                              .watch(checkboxNotifigerProvider)
                              .isTermsAccepted,
                        ),
                        TermsOfUseCheckBox(
                          contents: '(필수) 개인정보 수집 및 이용동의',
                          toggleCallback: ref
                              .read(checkboxNotifigerProvider.notifier)
                              .togglePrivacy,
                          isChecked: ref
                              .watch(checkboxNotifigerProvider)
                              .isPrivacyAccepted,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TermsOfUseCheckBox extends ConsumerWidget {
  const TermsOfUseCheckBox(
      {super.key,
      required this.contents,
      required this.toggleCallback,
      required this.isChecked});

  final String contents;
  final VoidCallback toggleCallback;
  final bool isChecked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isChecked = ref.watch(termCheckBoxProvider);
    return Row(children: [
      CustomCheckbox(
        isChecked: isChecked,
        toggleCallback: toggleCallback,
      ),
      const SizedBox(width: 12),
      Text(
        contents,
      ),
      const Spacer(),
      TextButton(
        onPressed: () {},
        child: const Text(
          '보기',
          style: TextStyle(fontSize: 14, color: AppColors.darkColor_3),
        ),
      ),
    ]);
  }
}

class SignupBgWidget extends StatelessWidget {
  const SignupBgWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 + 30,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/test/test_img_1.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2 + 30,
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.white.withOpacity(0.8), // 하단에 진한 하얀색
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.5), // 상단으로 갈수록 투명
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
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
