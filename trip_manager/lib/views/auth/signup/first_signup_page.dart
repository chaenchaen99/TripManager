import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/config/router/router_names.dart';
import 'package:trip_manager/shared/custom_divider.dart';
import 'package:trip_manager/shared/custom_widgets.dart';
import 'package:trip_manager/views/auth/signup/providers/term_checkbox.dart';
import 'package:trip_manager/views/auth/start/widgets/custom_button.dart';

import '../../../theme.dart';
import 'widgets/custom_checkbox.dart';

class FirstSignupPage extends ConsumerWidget {
  const FirstSignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkBoxState = ref.watch(termCheckboxProvider);
    final isAllAccepted =
        checkBoxState.isTermsAccepted && checkBoxState.isPrivacyAccepted;

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
                              .read(termCheckboxProvider.notifier)
                              .toggleTerms,
                          isChecked: checkBoxState.isTermsAccepted,
                        ),
                        TermsOfUseCheckBox(
                          contents: '(필수) 개인정보 수집 및 이용동의',
                          toggleCallback: ref
                              .read(termCheckboxProvider.notifier)
                              .togglePrivacy,
                          isChecked: checkBoxState.isPrivacyAccepted,
                        ),
                        const SizedBox(height: 12),
                        const CustomDivider(
                          color: AppColors.lightColor_2,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CustomCheckbox(
                                isChecked: isAllAccepted,
                                toggleCallback: () {
                                  bool newValue = !(isAllAccepted);
                                  ref
                                      .read(termCheckboxProvider.notifier)
                                      .toggleAll(newValue);
                                }),
                            const SizedBox(width: 12),
                            const Text(
                              '전체동의',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
                bottom: 1,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, bottom: 35.0),
                  child: CustomButton(
                      text: '다음',
                      onPressed: isAllAccepted
                          ? () {
                              context.pushNamed(RouteNames.email);
                            }
                          : null),
                )),
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
