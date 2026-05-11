import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/features/auth/domain/usecase/sign_in_use_case.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_view_model_state.dart';
@injectable
class SignInViewModelCubit extends Cubit<SignInViewModelState> {
  SignInViewModelCubit(this.signInUseCase) : super(SignInViewModelInitial());
  SignInUseCase signInUseCase;
  signIn(String email,String password)async{
    emit(LoadingState());
    var result = await signInUseCase.call(email, password);
    switch(result){
      case Success<AuthEntity>():{
        emit(SuccessState(result.response));
      }
      case Failure<AuthEntity>():{
        emit(ErrorState(result.error));
      }
    }
  }
}
