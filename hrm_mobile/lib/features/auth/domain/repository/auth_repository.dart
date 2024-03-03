import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/auth/domain/entities/login_entity.dart';
import 'package:hrm_mobile/features/auth/domain/entities/otp_entity.dart';

abstract class AuthRepository {
  
  Future<DataState<String>> login(LoginInEntity loginEntity);
  Future<DataState<ReturnResult<String>>> sendOTP(OTPEntity otpEntity);
  Future<DataState<ReturnResult<bool>>> validateOTP(OTPEntity otpEntity);
  Future<DataState<ReturnResult<String>>> changePassword(OTPEntity otpEntity);
}