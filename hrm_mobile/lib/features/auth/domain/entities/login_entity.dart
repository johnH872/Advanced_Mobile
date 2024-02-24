import 'package:equatable/equatable.dart';

class LoginInEntity extends Equatable {
  final String email;
  final String password;

  const LoginInEntity({ required this.password, required this.email});

  @override
  List<Object?> get props => [ password, email];
}