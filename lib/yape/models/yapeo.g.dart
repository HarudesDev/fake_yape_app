// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapeo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YapeoImpl _$$YapeoImplFromJson(Map<String, dynamic> json) => _$YapeoImpl(
      id: (json['id'] as num).toInt(),
      yapeoAmount: (json['yapeo_amount'] as num).toDouble(),
      yapeoDate: DateTime.parse(json['yapeo_date'] as String),
      senderName: json['sender_name'] as String,
      receiverName: json['receiver_name'] as String,
      senderPhone: json['sender_phone'] as String,
      receiverPhone: json['receiver_phone'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$YapeoImplToJson(_$YapeoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'yapeo_amount': instance.yapeoAmount,
      'yapeo_date': instance.yapeoDate.toIso8601String(),
      'sender_name': instance.senderName,
      'receiver_name': instance.receiverName,
      'sender_phone': instance.senderPhone,
      'receiver_phone': instance.receiverPhone,
      'message': instance.message,
    };
