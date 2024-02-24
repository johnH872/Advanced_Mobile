import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/core/usecase/usecase.dart';
import 'package:hrm_mobile/features/auth/data/models/login_model.dart';
import 'package:hrm_mobile/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase implements UseCase<DataState<String>, LoginModel> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  
  @override
  Future<DataState<String>> call({LoginModel? params}){
    return authRepository.login(params!);
  }
}