import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/return_result.dart';
import 'package:hrm_mobile/features/auth/data/models/login_model.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
part 'auth_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/auth/')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('login')
  Future<HttpResponse<String>> login(@Body() LoginModel loginModel);

  @POST('generateOTP')
  Future<HttpResponse<ReturnResult<String>>> sendOTP(@Body() OTPModel otpModel);

  @POST('validateOTP')
  Future<HttpResponse<ReturnResult<bool>>> validateOTP(@Body() OTPModel otpModel);

  @POST('changePasswordOTP')
  Future<HttpResponse<ReturnResult<String>>> changePassword(@Body() OTPModel otpModel);
}