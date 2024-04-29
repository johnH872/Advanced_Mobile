class UserEntity {
  final String? userId;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final DateTime? birth;
  final String? gender;
  final String? nationality;
  final String? avatarUrl;
  final String? phoneNumber;
  final String? jobTitle;
  final DateTime? dateStartConttract;
  final String? ownerId;
  final UserEntity? manager;
  
  UserEntity({
    this.userId,
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
    this.manager
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?, 
      birth: json['birth'] as DateTime,
      gender: json['gender'] as String,
      nationality: json['nationality'] as String,
      avatarUrl: json['avatarUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
      jobTitle: json['jobTitle'] as String?,
      ownerId: json['ownerId'] as String?,
    );
  }
}
