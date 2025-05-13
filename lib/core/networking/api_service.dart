import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_constants.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/sign_up/data/models/sign_up_request_body.dart';
import '../../features/sign_up/data/models/sign_up_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  @POST(ApiConstants.signupEndpoint)
  Future<SignUpResponse> register(@Body() SignUpRequestBody signupRequestBody);
}
