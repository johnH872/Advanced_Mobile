import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/auth/data/data_sources/auth_api_services.dart';
import 'package:hrm_mobile/features/auth/data/models/login_model.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/domain/entities/login_entity.dart';
import 'package:hrm_mobile/features/auth/domain/entities/otp_entity.dart';
import 'package:hrm_mobile/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService;
  AuthRepositoryImpl({
    required this.authApiService,
  });
  
  @override
  Future<DataState<String>> login(LoginInEntity loginInEntity) async{
    try {
      final httpResponse = await authApiService.login(LoginModel.fromEntity(loginInEntity));
      
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: httpResponse.data,
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ReturnResult<String>>> changePassword(OTPEntity otpEntity) async{
    try {
      final httpResponse = await authApiService.changePassword(OTPModel.fromEntity(otpEntity));
      
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: httpResponse.data.message,
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ReturnResult<String>>> sendOTP(OTPEntity otpEntity) async {
    try {
      final httpResponse = await authApiService.sendOTP(OTPModel.fromEntity(otpEntity));
      
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: httpResponse.data.message,
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ReturnResult<bool>>> validateOTP(OTPEntity otpEntity) async{
    try {
      final httpResponse = await authApiService.validateOTP(OTPModel.fromEntity(otpEntity));
      
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: httpResponse.data.message,
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(error) {
      return DataFailed(error);
    }
  }

}
