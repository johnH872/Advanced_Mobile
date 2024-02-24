import 'package:hrm_mobile/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginInEntity {

  const LoginModel({required String email,required String password})
      : super(  email: email, password: password);
  
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
    };
  }
}
