import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/auth/data/api/auth_client.dart';
import 'package:ecommerce_app/features/auth/data/model/auth_response/auth_response.dart';

abstract interface class AuthDao {
  Future<ApiResult<AuthResponse>> signUp(String name , String phone , String email,String password , String rePassword);
  Future<ApiResult<AuthResponse>> signIn(String email,String password);
}