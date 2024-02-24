part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final DioException? dioException;
  final String? token;
  const AuthState({this.dioException, this.token});
  
  @override
  List<Object> get props => [dioException!, token!];
}

final class AuthInitial extends AuthState {}

final class LoadingState extends AuthState{}

final class LoggedOutState extends AuthState{}

final class LoggedInState extends AuthState{}

final class SendOTPState extends AuthState{
  final String email ;
  const SendOTPState({required this.email});
  @override
  List<Object> get props => [email];
}

final class SendOTPSuccessState extends AuthState{}

// final class ValidateOTPState extends AuthState{
//   final String email;
//   final String otp;
//   const ValidateOTPState({required this.email, required this.otp});
//   @override
//   List<Object> get props => [email];
// }

final class ValidOTPState extends AuthState{}

final class ChangePasswordSuccess extends AuthState{
  final String message ;
  const ChangePasswordSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class ErrorAuthState extends AuthState{
  final String message ;
  const ErrorAuthState({required this.message});
  @override
  List<Object> get props => [message];
}
