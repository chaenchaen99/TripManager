import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../model/ai/chat_model.dart';
part 'chat_view_model.freezed.dart';
part 'chat_view_model.g.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatModel> messages,
    @Default(AsyncValue<List<ChatModel>>.data([]))
    AsyncValue<List<ChatModel>> chatState,
    String? error,
  }) = _ChatState;
}

// ViewModel 정의
@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  ChatState build() {
    return const ChatState();
  }

  Future<void> sendMessage(String message) async {
    state = state.copyWith(chatState: const AsyncValue.loading());

    try {
      // Simulate sending message and receiving response
      await Future.delayed(const Duration(seconds: 5));

      const response = 'AI가 추천하는 서울 1박2일 일정은 다음과 같습니다...';

      final newMessage = ChatModel(sender: 'user', response: message);
      const aiResponse = ChatModel(sender: 'ai', response: response);

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
