// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
      gender: json['gender'] as String?,
      nationality: json['nationality'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      jobTitle: json['jobTitle'] as String?,
      dateStartConttract: json['dateStartConttract'] == null
          ? null
          : DateTime.parse(json['dateStartConttract'] as String),
      ownerId: json['ownerId'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'email': instance.email,
      'birth': instance.birth?.toIso8601String(),
      'gender': instance.gender,
      'nationality': instance.nationality,
      'avatarUrl': instance.avatarUrl,
      'phoneNumber': instance.phoneNumber,
      'jobTitle': instance.jobTitle,
      'dateStartConttract': instance.dateStartConttract?.toIso8601String(),
      'ownerId': instance.ownerId,
    };
