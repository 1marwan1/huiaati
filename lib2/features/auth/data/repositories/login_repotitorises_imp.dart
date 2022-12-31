import 'package:hotel_data/features/auth/domain/entities/login.dart';
import 'package:hotel_data/features/auth/domain/entities/verfy_otp.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/login_repostitorise.dart';
import '../dataSourse/login_remote_data_source.dart';

typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class LoginRepostitoryImpl extends LoginRepostitory {
  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  LoginRepostitoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Faiture, Login>> checkUpLogin(
      {required String mobile, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.checkUpLogin(
            mobile: mobile, password: password);

        return Right(remotePosts);
      } on ServerExecption {
        return Left(ServerFaiture());
      }
    } else {
      return Left(OfflineFaiture());
    }
  }

  @override
  Future<Either<Faiture, VerifyOptLogin>> checkVerifyOptLogin(
      {required String mobile, required String otp}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.checkVerifyOtpUpLogin(
            mobile: mobile, otp: otp);

        return Right(remotePosts);
      } on ServerExecption {
        return Left(ServerFaiture());
      }
    } else {
      return Left(OfflineFaiture());
    }
  }
}
