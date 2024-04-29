// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get userId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  DateTime? get birth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get jobTitle => throw _privateConstructorUsedError;
  DateTime? get dateStartConttract => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  UserModel? get manager => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? userId,
      String? firstName,
      String? middleName,
      String? lastName,
      String? email,
      DateTime? birth,
      String? gender,
      String? nationality,
      String? avatarUrl,
      String? phoneNumber,
      String? jobTitle,
      DateTime? dateStartConttract,
      String? ownerId,
      UserModel? manager});

  $UserModelCopyWith<$Res>? get manager;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? birth = freezed,
    Object? gender = freezed,
    Object? nationality = freezed,
    Object? avatarUrl = freezed,
    Object? phoneNumber = freezed,
    Object? jobTitle = freezed,
    Object? dateStartConttract = freezed,
    Object? ownerId = freezed,
    Object? manager = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      birth: freezed == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStartConttract: freezed == dateStartConttract
          ? _value.dateStartConttract
          : dateStartConttract // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get manager {
    if (_value.manager == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.manager!, (value) {
      return _then(_value.copyWith(manager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? firstName,
      String? middleName,
      String? lastName,
      String? email,
      DateTime? birth,
      String? gender,
      String? nationality,
      String? avatarUrl,
      String? phoneNumber,
      String? jobTitle,
      DateTime? dateStartConttract,
      String? ownerId,
      UserModel? manager});

  @override
  $UserModelCopyWith<$Res>? get manager;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? birth = freezed,
    Object? gender = freezed,
    Object? nationality = freezed,
    Object? avatarUrl = freezed,
    Object? phoneNumber = freezed,
    Object? jobTitle = freezed,
    Object? dateStartConttract = freezed,
    Object? ownerId = freezed,
    Object? manager = freezed,
  }) {
    return _then(_$UserModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      birth: freezed == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStartConttract: freezed == dateStartConttract
          ? _value.dateStartConttract
          : dateStartConttract // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.userId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.birth,
      this.gender,
      this.nationality,
      this.avatarUrl,
      this.phoneNumber,
      this.jobTitle,
      this.dateStartConttract,
      this.ownerId,
      this.manager});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final DateTime? birth;
  @override
  final String? gender;
  @override
  final String? nationality;
  @override
  final String? avatarUrl;
  @override
  final String? phoneNumber;
  @override
  final String? jobTitle;
  @override
  final DateTime? dateStartConttract;
  @override
  final String? ownerId;
  @override
  final UserModel? manager;

  @override
  String toString() {
    return 'UserModel(userId: $userId, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, birth: $birth, gender: $gender, nationality: $nationality, avatarUrl: $avatarUrl, phoneNumber: $phoneNumber, jobTitle: $jobTitle, dateStartConttract: $dateStartConttract, ownerId: $ownerId, manager: $manager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.birth, birth) || other.birth == birth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.dateStartConttract, dateStartConttract) ||
                other.dateStartConttract == dateStartConttract) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.manager, manager) || other.manager == manager));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      firstName,
      middleName,
      lastName,
      email,
      birth,
      gender,
      nationality,
      avatarUrl,
      phoneNumber,
      jobTitle,
      dateStartConttract,
      ownerId,
      manager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? userId,
      final String? firstName,
      final String? middleName,
      final String? lastName,
      final String? email,
      final DateTime? birth,
      final String? gender,
      final String? nationality,
      final String? avatarUrl,
      final String? phoneNumber,
      final String? jobTitle,
      final DateTime? dateStartConttract,
      final String? ownerId,
      final UserModel? manager}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  DateTime? get birth;
  @override
  String? get gender;
  @override
  String? get nationality;
  @override
  String? get avatarUrl;
  @override
  String? get phoneNumber;
  @override
  String? get jobTitle;
  @override
  DateTime? get dateStartConttract;
  @override
  String? get ownerId;
  @override
  UserModel? get manager;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
