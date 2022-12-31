import 'package:get_it/get_it.dart';
import 'package:hotel_data/core/network/network_info.dart';
import 'package:hotel_data/features/auth/data/dataSourse/login_remote_data_source.dart';
import 'package:hotel_data/features/auth/data/repositories/login_repotitorises_imp.dart';
import 'package:hotel_data/features/auth/domain/repositories/login_repostitorise.dart';
import 'package:hotel_data/features/auth/persention/bloc/signin_bloc/sign_in_bloc_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hotel_data/features/auth/domain/usecases/checkup_login_usescases.dart';
import 'package:hotel_data/features/auth/domain/usecases/checkup_verifyopt_login_usecases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! features - posts

  //? Bloc
  sl.registerFactory(() => SignInBlocBloc(
      checkUpLoginUseCases: sl(), checkUpVerigyOtpLoginUseCases: sl()));

  //=============================

  //? UseCase
  sl.registerLazySingleton(() => CheckUpLoginUseCases(sl()));
  sl.registerLazySingleton(() => CheckUpVerigyOtpLoginUseCases(sl()));
  //===========================================================

  //? Repository
  sl.registerLazySingleton<LoginRepostitory>(
      () => LoginRepostitoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  //=============================

  //? Datasources

  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteImplWithHttp(client: sl()));

  //=============================

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(connectionChecker: sl()));

  //! External
  //? sharedPreferences
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
