import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/auth/domain/entities/login_entity.dart';
import 'package:hrm_mobile/features/auth/domain/entities/otp_entity.dart';

abstract class AuthRepository {
  
  Future<DataState<String>> login(LoginInEntity loginModel);
  Future<DataState<ReturnResult<String>>> sendOTP(OTPEntity otpModel);
  Future<DataState<ReturnResult<bool>>> validateOTP(OTPEntity otpModel);
  Future<DataState<ReturnResult<String>>> changePassword(OTPEntity otpModel);
}