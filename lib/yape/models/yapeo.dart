import 'package:freezed_annotation/freezed_annotation.dart';

part 'yapeo.freezed.dart';
part 'yapeo.g.dart';

@freezed
class Yapeo with _$Yapeo {
  const Yapeo._();
// ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Yapeo({
    required int id,
    required double yapeoAmount,
    required DateTime yapeoDate,
    required String senderName,
    required String receiverName,
    required String senderPhone,
    required String receiverPhone,
    String? message,
  }) = _Yapeo;

  factory Yapeo.fromJson(Map<String, Object?> json) => _$YapeoFromJson(json);
}
