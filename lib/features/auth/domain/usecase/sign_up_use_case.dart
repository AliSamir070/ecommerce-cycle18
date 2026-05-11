import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/api_result.dart';
import '../entity/auth_entity.dart';

@singleton
class SignUpUseCase {
  AuthRepo authRepo;

  SignUpUseCase(this.authRepo);

  // execute
  // invoke
  Future<ApiResult<AuthEntity>> call(String name, String phone, String email,
          String password, String rePassword) =>
      authRepo.signUp(name, phone, email, password, rePassword);
}
