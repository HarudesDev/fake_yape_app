// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyUser _$MyUserFromJson(Map<String, dynamic> json) {
  return _MyUser.fromJson(json);
}

/// @nodoc
mixin _$MyUser {
  int get id => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this MyUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyUserCopyWith<MyUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUserCopyWith<$Res> {
  factory $MyUserCopyWith(MyUser value, $Res Function(MyUser) then) =
      _$MyUserCopyWithImpl<$Res, MyUser>;
  @useResult
  $Res call(
      {int id,
      String fullname,
      @JsonKey(name: 'phone_number') String phoneNumber});
}

/// @nodoc
class _$MyUserCopyWithImpl<$Res, $Val extends MyUser>
    implements $MyUserCopyWith<$Res> {
  _$MyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullname = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyUserImplCopyWith<$Res> implements $MyUserCopyWith<$Res> {
  factory _$$MyUserImplCopyWith(
          _$MyUserImpl value, $Res Function(_$MyUserImpl) then) =
      __$$MyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String fullname,
      @JsonKey(name: 'phone_number') String phoneNumber});
}

/// @nodoc
class __$$MyUserImplCopyWithImpl<$Res>
    extends _$MyUserCopyWithImpl<$Res, _$MyUserImpl>
    implements _$$MyUserImplCopyWith<$Res> {
  __$$MyUserImplCopyWithImpl(
      _$MyUserImpl _value, $Res Function(_$MyUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullname = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$MyUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyUserImpl extends _MyUser {
  const _$MyUserImpl(
      {required this.id,
      required this.fullname,
      @JsonKey(name: 'phone_number') required this.phoneNumber})
      : super._();

  factory _$MyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyUserImplFromJson(json);

  @override
  final int id;
  @override
  final String fullname;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @override
  String toString() {
    return 'MyUser(id: $id, fullname: $fullname, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullname, phoneNumber);

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      __$$MyUserImplCopyWithImpl<_$MyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyUserImplToJson(
      this,
    );
  }
}

abstract class _MyUser extends MyUser {
  const factory _MyUser(
          {required final int id,
          required final String fullname,
          @JsonKey(name: 'phone_number') required final String phoneNumber}) =
      _$MyUserImpl;
  const _MyUser._() : super._();

  factory _MyUser.fromJson(Map<String, dynamic> json) = _$MyUserImpl.fromJson;

  @override
  int get id;
  @override
  String get fullname;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
