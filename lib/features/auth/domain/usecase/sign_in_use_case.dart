import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/api_result.dart';
import '../entity/auth_entity.dart';
@singleton
class SignInUseCase {
  AuthRepo authRepo;
  SignInUseCase(this.authRepo);

  Future<ApiResult<AuthEntity>> call(String email,String password)=>authRepo.signIn(email, password);
}