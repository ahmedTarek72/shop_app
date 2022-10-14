part of 'log_in_cubit.dart';

@immutable
abstract class LogInStates {}

class LogInInitial extends LogInStates {}
class LoginSuccessState extends LogInStates{
 final LoginModel model;

  LoginSuccessState(this.model);
}
class LoginLoadingState extends LogInStates{}
class LoginErrorState extends LogInStates{
  final String error;

  LoginErrorState(this.error);
}
class IsObscurePasswordState extends LogInStates {}