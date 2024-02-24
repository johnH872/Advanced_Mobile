import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/core/usecase/usecase.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/domain/repository/auth_repository.dart';

class ValidateOTPUseCase implements UseCase<DataState<ReturnResult<bool>>, OTPModel> {
  final AuthRepository authRepository;

  ValidateOTPUseCase({required this.authRepository});
  
  @override
  Future<DataState<ReturnResult<bool>>> call({OTPModel? params}){
    return authRepository.validateOTP(params!);
  }
}