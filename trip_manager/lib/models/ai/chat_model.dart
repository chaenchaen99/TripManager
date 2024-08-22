import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_manager/models/ai/response_model.dart';

part 'chat_model.freezed.dart';

enum Sender {
  ai,
  user,
}

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @Default(Sender.user) Sender sender,
    required List<ResponseModel> response,
  }) = _ChatModel;
}
