import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hrm_mobile/features/auth/data/data_sources/auth_api_services.dart';
import 'package:hrm_mobile/features/auth/data/repository/auth_repository_impl.dart';
import 'package:hrm_mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:hrm_mobile/features/auth/domain/usecases/validate_otp_usecase.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/cubit/app_cubit.dart';
import 'package:hrm_mobile/features/informations/data/data_sources/employee_api_services.dart';
import 'package:hrm_mobile/features/informations/data/repository/employee_repository_impl.dart';
import 'package:hrm_mobile/features/informations/domain/repository/employee_repository.dart';
import 'package:hrm_mobile/features/informations/presentation/provider/user_provider.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
   // Dependencies
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(authApiService:  sl()));
  sl.registerSingleton<EmployeeApiService>(EmployeeApiService(sl()));
  sl.registerSingleton<EmployeeRepository>(EmployeeRepositoryImpl(employeeApiService:  sl()));
  
  //UseCases
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ValidateOTPUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SendOTPUseCase(authRepository: sl()));

  //Blocs
  sl.registerFactory<AuthBloc>(()=> AuthBloc(logInUseCase: sl(), sendOTPUseCase: sl(), validateOTPUseCase: sl(), changePasswordUseCase: sl()));
  sl.registerFactory<AppCubit>(()=> AppCubit());
  sl.registerFactory<UserProvider>(()=> UserProvider());

  // External
  sl.registerLazySingleton(() => InternetConnection());
}