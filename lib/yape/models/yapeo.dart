// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'yapeo.freezed.dart';
part 'yapeo.g.dart';

@freezed
class Yapeo with _$Yapeo {
  const Yapeo._();

  const factory Yapeo({
    required int id,
    @JsonKey(name: 'yapeo_amount') required double yapeoAmount,
    @JsonKey(name: 'yapeo_date') required DateTime yapeoDate,
    required String senderName,
    required String receiverName,
    @JsonKey(name: 'sender_phone') required String senderPhone,
    @JsonKey(name: 'receiver_phone') required String receiverPhone,
    String? message,
  }) = _Yapeo;

  factory Yapeo.fromJson(Map<String, Object?> json) => _$YapeoFromJson(json);
}
