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
    state = state.copyWith(chatState: const AsyncValue.loading());

    try {
      // Simulate sending message and receiving response
      await Future.delayed(const Duration(seconds: 2));

      const response = 'AI가 추천하는 서울 1박2일 일정은 다음과 같습니다...';

      const newMessage = ChatModel(
          sender: Sender.user,
          response: [ResponseModel.userResponse(sendMessage: response)]);

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

      state = state.copyWith(
        chatState: AsyncValue.data([
          ...state.messages,
          newMessage,
          aiResponse,
        ]),
      );
    } catch (e, stackTrace) {
      state = state.copyWith(
        chatState: AsyncValue.error(e, stackTrace),
        error: e.toString(),
      );
    }
  }
}
