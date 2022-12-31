part of 'sign_in_bloc_bloc.dart';

abstract class SignInBlocEvent extends Equatable {
  const SignInBlocEvent();
  @override
  List<Object> get props => [];
}

class SendNumberPhoneSignInEvent extends SignInBlocEvent {
  const SendNumberPhoneSignInEvent(
      {required this.phoneNumber, required this.password});
  final String phoneNumber;
  final String password;
}

class SendOtpPhoneSignInEvent extends SignInBlocEvent {
  const SendOtpPhoneSignInEvent({required this.phoneNumber, required this.otp});
  final String phoneNumber;
  final String otp;
}

class ReptSendOtpPhoneSignInEvent extends SignInBlocEvent {
  const ReptSendOtpPhoneSignInEvent(
      {required this.phoneNumber, required this.password});
  final String phoneNumber;
  final String password;
}
