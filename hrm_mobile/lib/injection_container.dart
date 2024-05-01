import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hrm_mobile/features/attendance/data/data_sources/attendance_api_services.dart';
import 'package:hrm_mobile/features/attendance/data/repository/attendance_repository_impl.dart';
import 'package:hrm_mobile/features/attendance/domain/repository/attendance_repository.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
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
import 'package:hrm_mobile/features/informations/data/data_sources/media_api_serivices.dart';
import 'package:hrm_mobile/features/informations/data/repository/employee_repository_impl.dart';
import 'package:hrm_mobile/features/informations/data/repository/media_repository_impl.dart';
import 'package:hrm_mobile/features/informations/domain/repository/employee_repository.dart';
import 'package:hrm_mobile/features/informations/domain/repository/media_repository.dart';
import 'package:hrm_mobile/features/informations/presentation/provider/user_provider.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/datastate_api_services.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/leave_entitlement_api_services.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/leave_request_api_services.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/leave_type_api_services.dart';
import 'package:hrm_mobile/features/leave/data/repository/datastate_repository_impl.dart';
import 'package:hrm_mobile/features/leave/data/repository/leave_entitlement_repository_impl.dart';
import 'package:hrm_mobile/features/leave/data/repository/leave_request_repository_impl.dart';
import 'package:hrm_mobile/features/leave/data/repository/leave_type_repository_impl.dart';
import 'package:hrm_mobile/features/leave/domain/repository/datastate_repository.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_entitlement_repository.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_request_repository.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_type_repository.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/leave_provider.dart';
import 'package:hrm_mobile/features/notification/data/data_sources/notification_api_services.dart';
import 'package:hrm_mobile/features/notification/data/repository/notification_repository_impl.dart';
import 'package:hrm_mobile/features/notification/domain/repository/notification_repository.dart';
import 'package:hrm_mobile/features/notification/presentation/provider/notification_provider.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
   // Dependencies
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(authApiService:  sl()));
  sl.registerSingleton<EmployeeApiService>(EmployeeApiService(sl()));
  sl.registerSingleton<EmployeeRepository>(EmployeeRepositoryImpl(employeeApiService:  sl()));
  sl.registerSingleton<MediaApiService>(MediaApiService(sl()));
  sl.registerSingleton<MediaRepository>(MediaRepositoryImpl(mediaApiService:  sl()));
  sl.registerSingleton<AttendanceApiService>(AttendanceApiService(sl()));
  sl.registerSingleton<AttendanceRepository>(AttendanceRepositoryImpl(attendanceApiService:  sl()));
  sl.registerSingleton<LeaveTypeApiService>(LeaveTypeApiService(sl()));
  sl.registerSingleton<LeaveTypeRepository>(LeaveTypeRepositoryImpl(leaveTypeApiService:  sl()));
  sl.registerSingleton<LeaveRequestApiService>(LeaveRequestApiService(sl()));
  sl.registerSingleton<LeaveRequestRepository>(LeaveRequestRepositoryImpl(leaveRequestApiService:  sl()));
  sl.registerSingleton<LeaveEntitlementApiService>(LeaveEntitlementApiService(sl()));
  sl.registerSingleton<LeaveEntitlementRepository>(LeaveEntitlementRepositoryImpl(leaveEntitlementApiService:  sl()));
  sl.registerSingleton<DataStateApiService>(DataStateApiService(sl()));
  sl.registerSingleton<DataStateRepository>(DataStateRepositoryImpl(dataStateApiService:  sl()));
  sl.registerSingleton<NotificationApiService>(NotificationApiService(sl()));
  sl.registerSingleton<NotificationRepository>(NotificationRepositoryImpl(notificationApiService:  sl()));
  
  //UseCases
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ValidateOTPUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SendOTPUseCase(authRepository: sl()));

  //Blocs
  sl.registerFactory<AuthBloc>(()=> AuthBloc(logInUseCase: sl(), sendOTPUseCase: sl(), validateOTPUseCase: sl(), changePasswordUseCase: sl()));
  sl.registerFactory<AppCubit>(()=> AppCubit());
  sl.registerFactory<UserProvider>(()=> UserProvider());
  sl.registerFactory<AttendanceProvider>(()=> AttendanceProvider());
  sl.registerFactory<LeaveProvider>(()=> LeaveProvider());
  sl.registerFactory<NotificationProvider>(()=> NotificationProvider());

  // External
  sl.registerLazySingleton(() => InternetConnection());
}