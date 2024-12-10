// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class MyUser with _$MyUser {
  const MyUser._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MyUser({
    required int id,
    required String fullname,
    required String phoneNumber,
  }) = _MyUser;

  factory MyUser.fromJson(Map<String, Object?> json) => _$MyUserFromJson(json);
}
