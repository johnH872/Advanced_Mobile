import 'package:equatable/equatable.dart';

class OTPEntity extends Equatable {
  final String email;
  final String? password;
  final String? otp;

  const OTPEntity({ required this.email, this.password, this.otp});

  @override
  List<Object?> get props => [ password, email, otp];
}