import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/core/resources/internet_checker.dart';
import 'package:ecommerce_app/features/auth/data/datasource/auth_dao.dart';
import 'package:ecommerce_app/features/auth/data/model/auth_response/auth_response.dart';
import 'package:ecommerce_app/features/auth/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthDao authDao;
  AuthRepoImpl(this.authDao);
  @override
  Future<ApiResult<AuthEntity>> signUp(String name, String phone,
      String email, String password, String rePassword) async{
    bool connected = await InternetChecker.checkConnection();
    if(connected){
      var result = await authDao.signUp(name, phone, email, password, rePassword);
      switch(result){
        case Success<AuthResponse>():{
          return Success(result.response.toEntity());
        }
        case Failure<AuthResponse>():{
          return Failure(result.error);
        }
      }
    }else{
      return Failure("No Internet Connection");
    }
  }

  @override
  Future<ApiResult<AuthEntity>> signIn(String email, String password) async{
    bool connected = await InternetChecker.checkConnection();
    if(connected){
      var result = await authDao.signIn(email, password);
      switch(result){
        case Success<AuthResponse>():{
          return Success(result.response.toEntity());
        }
        case Failure<AuthResponse>():{
          return Failure(result.error);
        }
      }
    }else{
      return Failure("No Internet Connection");
    }
  }
}
