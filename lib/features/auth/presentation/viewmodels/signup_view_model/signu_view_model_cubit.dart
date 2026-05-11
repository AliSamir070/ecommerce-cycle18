import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/features/auth/domain/usecase/sign_up_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'signu_view_model_state.dart';

@injectable
class SignupViewModelCubit extends Cubit<SignupViewModelState> {
  SignupViewModelCubit(this.signUpUseCase) : super(SignupViewModelInitial());
  SignUpUseCase signUpUseCase;

  signUp(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String rePassword}) async{
    // loading
    emit(LoadingState());
    var result = await signUpUseCase.call(name, phone, email, password, rePassword);
    switch(result){
      case Success<AuthEntity>():{
        // success state
        emit(SuccessState(result.response));
      }
      case Failure<AuthEntity>():{
        // error state
        emit(ErrorState(result.error));
      }
    }
  }
}
