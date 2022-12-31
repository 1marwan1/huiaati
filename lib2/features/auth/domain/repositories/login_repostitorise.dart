import 'package:dartz/dartz.dart';
import 'package:hotel_data/features/auth/domain/entities/login.dart';
import 'package:hotel_data/features/auth/domain/entities/verfy_otp.dart';

import '../../../../core/error/faiture.dart';

abstract class LoginRepostitory {
  Future<Either<Faiture, Login>> checkUpLogin(
      {required String mobile, required String password});
  Future<Either<Faiture, VerifyOptLogin>> checkVerifyOptLogin(
      {required String mobile, required String otp});
}
