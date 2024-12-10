// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyUserImpl _$$MyUserImplFromJson(Map<String, dynamic> json) => _$MyUserImpl(
      id: (json['id'] as num).toInt(),
      fullname: json['fullname'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'phone_number': instance.phoneNumber,
    };
