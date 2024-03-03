
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';
@freezed
class UserModel extends UserEntity with _$UserModel{
  const factory UserModel({
    String? userId,
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

  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json)
        => _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      userId: entity.userId,
      firstName: entity.firstName,
      middleName: entity.middleName,
      lastName: entity.lastName,
      email: entity.email,
      birth: entity.birth,
      gender: entity.gender,
      nationality: entity.nationality,
      avatarUrl: entity.avatarUrl,
      phoneNumber: entity.phoneNumber,
      jobTitle: entity.jobTitle,
      dateStartConttract: entity.dateStartConttract,
      ownerId: entity.ownerId
    );
  }
}