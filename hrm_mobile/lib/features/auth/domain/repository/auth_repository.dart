import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/auth/data/models/login_model.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';

abstract class AuthRepository {
  
  Future<DataState<String>> login(LoginModel loginModel);
  Future<DataState<ReturnResult<String>>> sendOTP(OTPModel otpModel);
  Future<DataState<ReturnResult<bool>>> validateOTP(OTPModel otpModel);
  Future<DataState<ReturnResult<String>>> changePassword(OTPModel otpModel);
}