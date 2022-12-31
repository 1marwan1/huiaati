import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_data/features/auth/domain/entities/login.dart';
import 'package:hotel_data/features/auth/domain/entities/verfy_otp.dart';
import 'package:hotel_data/features/auth/domain/usecases/checkup_login_usescases.dart';
import 'package:hotel_data/features/auth/domain/usecases/checkup_verifyopt_login_usecases.dart';
import '../../../../../core/error/faiture.dart';
import '../../../../../core/strings/failure.dart';
part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBlocBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  final CheckUpLoginUseCases checkUpLoginUseCases;
  final CheckUpVerigyOtpLoginUseCases checkUpVerigyOtpLoginUseCases;
  SignInBlocBloc(
      {required this.checkUpLoginUseCases,
      required this.checkUpVerigyOtpLoginUseCases})
      : super(SingeInBlocInitial()) {
    on<SignInBlocEvent>((event, emit) async {
      if (event is SendNumberPhoneSignInEvent) {
        emit(SingeInBlocInitial());
        final failureOrLogin = await checkUpLoginUseCases(
            mobile: event.phoneNumber, password: event.password);
        emit(_mapFailureOrLoginToState(failureOrLogin));
        //  emit(SendNumberPhoneBlocState());
      } else if (event is SendOtpPhoneSignInEvent) {
        emit(VerifyOpBlocInitial());
        final failureOrVerifyOpt = await checkUpVerigyOtpLoginUseCases(
            mobile: event.phoneNumber, otp: event.otp);
        emit(_mapFailureOrVerifyOptToState(failureOrVerifyOpt));
      } else if (event is ReptSendOtpPhoneSignInEvent) {
        emit(VerifyOpBlocInitial());
        final failureOrLogin = await checkUpLoginUseCases(
            mobile: event.phoneNumber, password: event.password);
        emit(_mapFailureOrLoginToState(failureOrLogin));
      }
    });
  }
  SignInBlocState _mapFailureOrLoginToState(Either<Faiture, Login> either) {
    return either.fold(
        (failuer) => ErrorLoginState(message: _mapFailureToMessage(failuer)),
        (login) => SendNumberPhoneBlocState());
  }

  SignInBlocState _mapFailureOrVerifyOptToState(
      Either<Faiture, VerifyOptLogin> either) {
    return either.fold(
        (failuer) =>
            SignInSuccessfildBlocState(message: _mapFailureToMessage(failuer)),
        (login) => SignInSuccessfulBlocState());
  }

  String _mapFailureToMessage(Faiture failure) {
    switch (failure.runtimeType) {
      case ServerFaiture:
        return SERVER_FAILURE_MESSAGE;

      case EmtyCacheFaiture:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFaiture:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
