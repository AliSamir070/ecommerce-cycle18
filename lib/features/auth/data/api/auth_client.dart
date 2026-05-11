import 'package:ecommerce_app/features/auth/data/model/auth_response/auth_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
part 'auth_client.g.dart';
@singleton
@RestApi(baseUrl: 'https://ecommerce.routemisr.com')
abstract class AuthClient {
  @factoryMethod
  factory AuthClient(Dio dio) = _AuthClient;
  
  @POST("/api/v1/auth/signup")
  Future<AuthResponse> signUp(@Body() Map<String,dynamic> body);

  @POST("/api/v1/auth/signin")
  Future<AuthResponse> signIn(@Body() Map<String,dynamic> body);
}