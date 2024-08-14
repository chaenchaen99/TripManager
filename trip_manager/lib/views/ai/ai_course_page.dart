import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/const/constants.dart';
import 'package:trip_manager/shared/custom_divider.dart';
import 'package:trip_manager/theme.dart';

import '../../view_model/ai/chat_view_model.dart';

class AiCoursePage extends ConsumerStatefulWidget {
  const AiCoursePage({super.key});

  @override
  ConsumerState<AiCoursePage> createState() => _AiCoursePageState();
}

class _AiCoursePageState extends ConsumerState<AiCoursePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI코스',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(children: [
        Column(
          children: [
            const CustomDivider(
              color: AppColors.lightColor_2,
            ),
            Expanded(
              child: ref.watch(chatViewModelProvider).chatState.when(
                    data: (messages) {
                      if (messages.isEmpty) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '홍길동${AppStrings.ai_empty_msg_1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.darkColor_3,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              AppStrings.ai_empty_msg_2,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.darkColor_3,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            return ListTile(
                              title: Text(message.response),
                              subtitle: Text(message.sender),
                            );
                          },
                        );
                      }
                    },
                    error: (error, stack) => Center(
                      child: Text('오류 발생: $error'),
                    ),
                    loading: () => const Center(
                      child: Text('AI가 답변을 입력 중입니다...'),
                    ),
                  ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: '메시지를 입력하세요.',
                    ),
                    onChanged: (text) {
                      // setState(() {
                      //   _isTyping = text.isNotEmpty;
                      // });
                    },
                    onSubmitted: (text) {
                      if (text.isEmpty) return;
                      _controller.clear();
                      ref
                          .watch(chatViewModelProvider.notifier)
                          .sendMessage(text);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0), // 동그란 버튼
                    border: Border.all(
                      color: AppColors.lightColor_2, // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                  ),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/icon_submit.png',
                      height: 15,
                      width: 18,
                    ),
                    onPressed: () {}, // 메시지 전송
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
