import 'package:hrm_mobile/features/auth/domain/entities/otp_entity.dart';

class OTPModel extends OTPEntity {
  const OTPModel({required String email, String? password, String? otp})
      : super(email: email, password: password, otp: otp);

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'otp': otp};
  }

  factory OTPModel.fromEntity(OTPEntity entity) {
    return OTPModel(
      email: entity.email,
      password: entity.password,
      otp: entity.otp
    );
  }
}
