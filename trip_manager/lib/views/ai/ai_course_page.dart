import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/const/constants.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/shared/custom_divider.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/ai/providers/ai_chat_provider.dart';
import 'package:trip_manager/views/ai/widgets/ai_chat_item.dart';
import 'package:trip_manager/views/ai/widgets/ai_loading_page.dart';

import '../../models/ai/chat_model.dart';

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
            const CustomDivider(color: AppColors.lightColor_2),
            Expanded(
              // child: AiLoadingPage(),
              child: ref.watch(aiChatProvider).chatState.when(
                    data: (messages) {
                      if (messages.isEmpty) {
                        return const EmptyWidget();
                      } else {
                        return AiChatListView(chatItems: messages);
                      }
                    },
                    error: (error, stack) => Center(
                      child: ErrorWidget(error: error),
                    ),
                    loading: () => const Center(
                      child: AiLoadingPage(),
                    ),
                  ),
            ),
          ],
        ),
        BottomInputWidget(controller: _controller, ref: ref),
      ]),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final Object error;
  const ErrorWidget({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('오류 발생: $error');
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('AI가 답변을 입력 중입니다...');
  }
}

class BottomInputWidget extends StatelessWidget {
  const BottomInputWidget({
    super.key,
    required TextEditingController controller,
    required this.ref,
  }) : _controller = controller;

  final TextEditingController _controller;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                  ref.watch(aiChatProvider.notifier).sendMessage(text);
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
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}

class AiChatListView extends StatelessWidget {
  final List<ChatModel> chatItems;

  const AiChatListView({
    super.key,
    required this.chatItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatItems.length,
      itemBuilder: (context, index) {
        final chatItem = chatItems[index];

        // Check if the message is from AI
        if (chatItem.sender == Sender.ai) {
          // Filter for AiResponse items
          final aiResponses = chatItem.response
              .whereType<AiResponse>()
              .cast<AiResponse>()
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: aiResponses.map((courseItem) {
              return AiChatItem(courseItem: courseItem);
            }).toList(),
          );
        } else if (chatItem.sender == Sender.user) {
          // Handle UserResponse items
          final userResponses = chatItem.response
              .whereType<UserResponse>()
              .cast<UserResponse>()
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: userResponses.map((userResponse) {
              return ListTile(
                title: Text(userResponse.sendMessage),
              );
            }).toList(),
          );
        }

        // Return an empty container if the type is not handled
        return const SizedBox.shrink();
      },
    );
  }
}
