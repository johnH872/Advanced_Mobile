import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/core/usecase/usecase.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/domain/repository/auth_repository.dart';

class ChangePasswordUseCase implements UseCase<DataState<ReturnResult<String>>, OTPModel> {
  final AuthRepository authRepository;

  ChangePasswordUseCase({required this.authRepository});
  
  @override
  Future<DataState<ReturnResult<String>>> call({OTPModel? params}){
    return authRepository.changePassword(params!);
  }
}