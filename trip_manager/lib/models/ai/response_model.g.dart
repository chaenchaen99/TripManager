// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiResponseImpl _$$AiResponseImplFromJson(Map<String, dynamic> json) =>
    _$AiResponseImpl(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AiResponseImplToJson(_$AiResponseImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'runtimeType': instance.$type,
    };

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      sendMessage: json['sendMessage'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'sendMessage': instance.sendMessage,
      'runtimeType': instance.$type,
    };
