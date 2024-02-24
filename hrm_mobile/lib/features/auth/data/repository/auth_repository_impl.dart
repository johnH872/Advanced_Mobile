// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/auth/data/data_sources/auth_api_services.dart';
import 'package:hrm_mobile/features/auth/data/models/login_model.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService;
  AuthRepositoryImpl({
    required this.authApiService,
  });
  
  @override
  Future<DataState<String>> login(LoginModel loginModel) async{
    try {
      final httpResponse = await authApiService.login(loginModel);
      
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
  Future<DataState<ReturnResult<String>>> changePassword(OTPModel otpModel) async{
    try {
      final httpResponse = await authApiService.changePassword(otpModel);
      
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
  Future<DataState<ReturnResult<String>>> sendOTP(OTPModel otpModel) async {
    try {
      final httpResponse = await authApiService.sendOTP(otpModel);
      
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
  Future<DataState<ReturnResult<bool>>> validateOTP(OTPModel otpModel) async{
    try {
      final httpResponse = await authApiService.validateOTP(otpModel);
      
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
