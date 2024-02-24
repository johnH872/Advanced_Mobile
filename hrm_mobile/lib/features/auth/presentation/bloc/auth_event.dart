// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckLoggingInEvent extends AuthEvent{}

class LogOutEvent extends AuthEvent{}

class LogInEvent extends AuthEvent {
  final LoginModel loginModel ;
  const LogInEvent({required this.loginModel});
  @override
  List<Object> get props => [loginModel];
} 

class SendOTPEvent extends AuthEvent{
  final OTPModel otpModel;
  const SendOTPEvent({required this.otpModel});
  @override
  List<Object> get props => [otpModel];
}

class ValidateOTPEvent extends AuthEvent {
  final OTPModel otpModel;
  const ValidateOTPEvent({required this.otpModel});
  @override
  List<Object> get props => [otpModel];
}

class ChangePasswordEvent extends AuthEvent {
  final OTPModel otpModel;
  const ChangePasswordEvent({required this.otpModel});
  @override
  List<Object> get props => [otpModel];
}

