part of 'sign_in_bloc_bloc.dart';

abstract class SignInBlocState extends Equatable {
  const SignInBlocState();

  @override
  List<Object> get props => [];
}

class SingeInBlocInitial extends SignInBlocState {}

class VerifyOpBlocInitial extends SignInBlocState {}

class SendNumberPhoneBlocState extends SignInBlocState {}

class SignInSuccessfulBlocState extends SignInBlocState {}

class SignInSuccessfildBlocState extends SignInBlocState {
  final String message;
  const SignInSuccessfildBlocState({required this.message});
}

//!
class LoadedLoginState extends SignInBlocState {
  final Login login;
  const LoadedLoginState({required this.login});
  @override
  List<Object> get props => [login];
}

//! بحالة الاخطاء
class ErrorLoginState extends SignInBlocState {
  final String message;
  const ErrorLoginState({required this.message});
}
