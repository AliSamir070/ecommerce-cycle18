import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/auth/data/api/auth_client.dart';
import 'package:ecommerce_app/features/auth/data/datasource/auth_dao.dart';
import 'package:ecommerce_app/features/auth/data/model/auth_response/auth_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthDao)
class AuthApiDaoImpl implements AuthDao {
  AuthClient authClient;
  AuthApiDaoImpl(this.authClient);
  @override
  Future<ApiResult<AuthResponse>> signUp(String name, String phone,
      String email, String password, String rePassword) async{
    try{
      var response = await authClient.signUp({
        "name": name,
        "email":email,
        "password":password,
        "rePassword":rePassword,
        "phone":phone
      });
      if(response.statusMsg==null){
        // success
        return Success(response);
      }else{
        // failure
        return Failure(response.message!);
      }
    }catch(e){
      // failure
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<AuthResponse>> signIn(String email, String password) async{
    try{
      var response = await authClient.signIn({
       "email":email,
        "password":password
      });
      if(response.statusMsg==null){
        // success
        return Success(response);
      }else{
        // failure
        return Failure(response.message!);
      }
    }catch(e){
      // failure
      return Failure(e.toString());
    }
  }
}
