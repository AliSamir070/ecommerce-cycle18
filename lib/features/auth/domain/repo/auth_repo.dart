import '../../../../core/resources/api_result.dart';
import '../../data/model/auth_response/auth_response.dart';
import '../entity/auth_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<AuthEntity>> signUp(String name , String phone , String email,String password , String rePassword);
  Future<ApiResult<AuthEntity>> signIn(String email,String password);
}