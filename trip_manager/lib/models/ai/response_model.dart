import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart'; // JSON 직렬화를 위해 필요

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel.aiResponse({
    required String imageUrl,
    required String title,
    required String subTitle,
  }) = AiResponse; // 클래스 이름에 따라 자동으로 생성되는 서브클래스 이름

  const factory ResponseModel.userResponse({
    required String sendMessage,
  }) = UserResponse; // 클래스 이름에 따라 자동으로 생성되는 서브클래스 이름

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(
          json); // 이 메서드를 제대로 사용하기 위해서는 `json_serializable` 설정이 필요
}
