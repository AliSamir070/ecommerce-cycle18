part of 'sign_in_view_model_cubit.dart';

@immutable
sealed class SignInViewModelState {}

final class SignInViewModelInitial extends SignInViewModelState {}
final class LoadingState extends SignInViewModelState {}
final class SuccessState extends SignInViewModelState {
  AuthEntity authEntity;
  SuccessState(this.authEntity);
}
final class ErrorState extends SignInViewModelState {
  String error;
  ErrorState(this.error);
}
