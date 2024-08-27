import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_manager/models/ai/response_model.dart';

import '../../../models/ai/chat_model.dart';

part 'ai_chat_provider.freezed.dart';
part 'ai_chat_provider.g.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatModel> messages,
    @Default(AsyncValue<List<ChatModel>>.data([])) // Default to empty list
    AsyncValue<List<ChatModel>> chatState,
    String? loadingMessage,
    String? error,
  }) = _ChatState;
}

@riverpod
class AiChat extends _$AiChat {
  @override
  ChatState build() {
    return const ChatState();
  }

  Future<void> sendMessage(String message) async {
    state = state.copyWith(
      chatState: const AsyncValue.loading(),
      loadingMessage: message,
    );

    try {
      // Simulate sending message and receiving response
      await Future.delayed(const Duration(seconds: 2));

      final userMessage = ChatModel(
          sender: Sender.user,
          response: [ResponseModel.userResponse(sendMessage: message)]);

      const aiResponse = ChatModel(sender: Sender.ai, response: [
        ResponseModel.aiResponse(
            imageUrl: 'assets/images/test/test_img_1.png',
            title: '코스 1',
            subTitle: '1번코스 | 2번코스| 3번 코스'),
        ResponseModel.aiResponse(
            imageUrl: 'assets/images/test/test_img_1.png',
            title: '코스 2',
            subTitle: '1번코스 | 2번코스| 3번 코스'),
        ResponseModel.aiResponse(
            imageUrl: 'assets/images/test/test_img_1.png',
            title: '코스 3',
            subTitle: '1번코스 | 2번코스| 3번 코스'),
        ResponseModel.aiResponse(
            imageUrl: 'assets/images/test/test_img_1.png',
            title: '코스 4',
            subTitle: '1번코스 | 2번코스| 3번 코스')
      ]);

      final updatedMessages = [
        ...state.messages, // 기존 메시지
        userMessage, // 새로 추가된 사용자 메시지
        aiResponse, // AI 응답
      ];

      state = state.copyWith(
        messages: updatedMessages,
        chatState: AsyncValue.data(updatedMessages),
      );
    } catch (e, stackTrace) {
      state = state.copyWith(
        chatState: AsyncValue.error(e, stackTrace),
        error: e.toString(),
      );
    }
  }
}
