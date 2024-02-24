import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hrm_mobile/features/auth/data/models/login_model.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/validate_otp_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase logInUseCase;
  final SendOTPUseCase sendOTPUseCase;
  final ValidateOTPUseCase validateOTPUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  // final SignUpUseCase signUpUseCase ;
  // final VerifyEmailUseCase verifyEmailUseCase;
  // final FirstPageUseCase  firstPage;
  // final CheckVerificationUseCase checkVerificationUseCase;
  // final LogOutUseCase logOutUseCase;
  // final GoogleAuthUseCase googleAuthUseCase;
  Completer<void> completer = Completer<void>();
  late SharedPreferences prefs;

  AuthBloc({
    required this.logInUseCase,
    required this.sendOTPUseCase,
    required this.validateOTPUseCase,
    required this.changePasswordUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      if (event is CheckLoggingInEvent) {
        if (isLoggedIn()) emit(LoggedInState());
      } else if (event is LogInEvent) {
        emit(LoadingState());
        final loginDataState = await logInUseCase(params: event.loginModel);
        if (loginDataState.data != null) {
          saveToken(loginDataState.data);
          emit(LoggedInState());
        }
        if (loginDataState.error != null) {
          emit(ErrorAuthState(message: loginDataState.error!.response!.data));
        }
      } else if (event is SendOTPEvent) {
        emit(LoadingState());
        var result = await sendOTPUseCase(params: event.otpModel);
        if (result.data != null && result.data!.message == null) {
          emit(SendOTPSuccessState());
        }
        if (result.error != null) {
          emit(ErrorAuthState(message: result.error!.response!.data));
        }
      } else if (event is ValidateOTPEvent) {
        emit(LoadingState());
        var result = await validateOTPUseCase(params: event.otpModel);
        bool isValid = result.data?.result ?? false;
        if (isValid) {
          emit(ValidOTPState());
        }
        if (!isValid || result.error != null) {
          emit(const ErrorAuthState(message: "Wrong OTP"));
        }
      } else if (event is ChangePasswordEvent) {
        emit(LoadingState());
        var result = await changePasswordUseCase(params: event.otpModel);
        if (result.data != null && result.data!.result != null) {
          emit(ChangePasswordSuccess(message: result.data!.result!));
        }
        if (result.error != null || result.data!.result == null) {
          emit(ErrorAuthState(message: result.error!.response!.data));
        }
      } else if (event is LogOutEvent) {
        clearToken();
        emit(LoggedOutState());
      }
    });
  }

  saveToken(String? token) {
    if (token != null) prefs.setString("accessToken", token);
  }

  isLoggedIn() {
    try {
      var token = prefs.getString("accessToken");
      if (JwtDecoder.tryDecode(token!) != null) {
        if (!JwtDecoder.isExpired(token)) return true;
      }
    } catch (error) {
      return false;
    }
    return false;
  }

  clearToken() {
    prefs.clear();
  }

  // AuthState eitherToState ( DataState either , AuthState state){
  //   return either.fold(
  //         (failure) => ErrorAuthState(message: _mapFailureToMessage(failure)),
  //         (_) => state,
  //   );
  // }

  // String _mapFailureToMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return SERVER_FAILURE_MESSAGE;
  //     case OfflineFailure:
  //       return OFFLINE_FAILURE_MESSAGE;
  //     case WeekPassFailure:
  //       return WEEK_PASS_FAILURE_MESSAGE;
  //     case ExistedAccountFailure:
  //       return EXISTED_ACCOUNT_FAILURE_MESSAGE;
  //     case NoUserFailure:
  //       return NO_USER_FAILURE_MESSAGE;
  //     case TooManyRequestsFailure:
  //       return TOO_MANY_REQUESTS_FAILURE_MESSAGE;
  //     case WrongPasswordFailure:
  //       return WRONG_PASSWORD_FAILURE_MESSAGE;
  //     case UnmatchedPassFailure:
  //       return UNMATCHED_PASSWORD_FAILURE_MESSAGE;
  //     case NotLoggedInFailure:
  //       return '';
  //     default:
  //       return "Unexpected Error , Please try again later .";
  //   }
  // }
}
