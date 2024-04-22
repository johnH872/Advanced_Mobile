import 'package:equatable/equatable.dart';

class TokenPayLoadEntity extends Equatable {
  final String? userId;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final String? jobTitle;
  final String? ownerId;
  final String? avatarUrl;
  final List<dynamic>? roles;

  const TokenPayLoadEntity({
    this.userId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.jobTitle,
    this.ownerId,
    this.avatarUrl,
    this.roles,
  });

  factory TokenPayLoadEntity.fromJson(Map<String, dynamic> json) {
    return TokenPayLoadEntity(
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?, 
      jobTitle: json['jobTitle'] as String?,
      ownerId: json['ownerId'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      roles: (json['roles'] as List?)?.map((e) => e).toList(),
    );
  }

  @override
  List<Object?> get props => [userId, firstName, middleName, lastName, email, jobTitle, ownerId, avatarUrl, roles];
}
