// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yapeo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Yapeo _$YapeoFromJson(Map<String, dynamic> json) {
  return _Yapeo.fromJson(json);
}

/// @nodoc
mixin _$Yapeo {
  int get id => throw _privateConstructorUsedError;
  double get yapeoAmount => throw _privateConstructorUsedError;
  DateTime get yapeoDate => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String get receiverName => throw _privateConstructorUsedError;
  String get senderPhone => throw _privateConstructorUsedError;
  String get receiverPhone => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this Yapeo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Yapeo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YapeoCopyWith<Yapeo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YapeoCopyWith<$Res> {
  factory $YapeoCopyWith(Yapeo value, $Res Function(Yapeo) then) =
      _$YapeoCopyWithImpl<$Res, Yapeo>;
  @useResult
  $Res call(
      {int id,
      double yapeoAmount,
      DateTime yapeoDate,
      String senderName,
      String receiverName,
      String senderPhone,
      String receiverPhone,
      String? message});
}

/// @nodoc
class _$YapeoCopyWithImpl<$Res, $Val extends Yapeo>
    implements $YapeoCopyWith<$Res> {
  _$YapeoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Yapeo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? yapeoAmount = null,
    Object? yapeoDate = null,
    Object? senderName = null,
    Object? receiverName = null,
    Object? senderPhone = null,
    Object? receiverPhone = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      yapeoAmount: null == yapeoAmount
          ? _value.yapeoAmount
          : yapeoAmount // ignore: cast_nullable_to_non_nullable
              as double,
      yapeoDate: null == yapeoDate
          ? _value.yapeoDate
          : yapeoDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      senderPhone: null == senderPhone
          ? _value.senderPhone
          : senderPhone // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPhone: null == receiverPhone
          ? _value.receiverPhone
          : receiverPhone // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YapeoImplCopyWith<$Res> implements $YapeoCopyWith<$Res> {
  factory _$$YapeoImplCopyWith(
          _$YapeoImpl value, $Res Function(_$YapeoImpl) then) =
      __$$YapeoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double yapeoAmount,
      DateTime yapeoDate,
      String senderName,
      String receiverName,
      String senderPhone,
      String receiverPhone,
      String? message});
}

/// @nodoc
class __$$YapeoImplCopyWithImpl<$Res>
    extends _$YapeoCopyWithImpl<$Res, _$YapeoImpl>
    implements _$$YapeoImplCopyWith<$Res> {
  __$$YapeoImplCopyWithImpl(
      _$YapeoImpl _value, $Res Function(_$YapeoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Yapeo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? yapeoAmount = null,
    Object? yapeoDate = null,
    Object? senderName = null,
    Object? receiverName = null,
    Object? senderPhone = null,
    Object? receiverPhone = null,
    Object? message = freezed,
  }) {
    return _then(_$YapeoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      yapeoAmount: null == yapeoAmount
          ? _value.yapeoAmount
          : yapeoAmount // ignore: cast_nullable_to_non_nullable
              as double,
      yapeoDate: null == yapeoDate
          ? _value.yapeoDate
          : yapeoDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      senderPhone: null == senderPhone
          ? _value.senderPhone
          : senderPhone // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPhone: null == receiverPhone
          ? _value.receiverPhone
          : receiverPhone // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$YapeoImpl extends _Yapeo {
  const _$YapeoImpl(
      {required this.id,
      required this.yapeoAmount,
      required this.yapeoDate,
      required this.senderName,
      required this.receiverName,
      required this.senderPhone,
      required this.receiverPhone,
      this.message})
      : super._();

  factory _$YapeoImpl.fromJson(Map<String, dynamic> json) =>
      _$$YapeoImplFromJson(json);

  @override
  final int id;
  @override
  final double yapeoAmount;
  @override
  final DateTime yapeoDate;
  @override
  final String senderName;
  @override
  final String receiverName;
  @override
  final String senderPhone;
  @override
  final String receiverPhone;
  @override
  final String? message;

  @override
  String toString() {
    return 'Yapeo(id: $id, yapeoAmount: $yapeoAmount, yapeoDate: $yapeoDate, senderName: $senderName, receiverName: $receiverName, senderPhone: $senderPhone, receiverPhone: $receiverPhone, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YapeoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.yapeoAmount, yapeoAmount) ||
                other.yapeoAmount == yapeoAmount) &&
            (identical(other.yapeoDate, yapeoDate) ||
                other.yapeoDate == yapeoDate) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.senderPhone, senderPhone) ||
                other.senderPhone == senderPhone) &&
            (identical(other.receiverPhone, receiverPhone) ||
                other.receiverPhone == receiverPhone) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, yapeoAmount, yapeoDate,
      senderName, receiverName, senderPhone, receiverPhone, message);

  /// Create a copy of Yapeo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YapeoImplCopyWith<_$YapeoImpl> get copyWith =>
      __$$YapeoImplCopyWithImpl<_$YapeoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YapeoImplToJson(
      this,
    );
  }
}

abstract class _Yapeo extends Yapeo {
  const factory _Yapeo(
      {required final int id,
      required final double yapeoAmount,
      required final DateTime yapeoDate,
      required final String senderName,
      required final String receiverName,
      required final String senderPhone,
      required final String receiverPhone,
      final String? message}) = _$YapeoImpl;
  const _Yapeo._() : super._();

  factory _Yapeo.fromJson(Map<String, dynamic> json) = _$YapeoImpl.fromJson;

  @override
  int get id;
  @override
  double get yapeoAmount;
  @override
  DateTime get yapeoDate;
  @override
  String get senderName;
  @override
  String get receiverName;
  @override
  String get senderPhone;
  @override
  String get receiverPhone;
  @override
  String? get message;

  /// Create a copy of Yapeo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YapeoImplCopyWith<_$YapeoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
