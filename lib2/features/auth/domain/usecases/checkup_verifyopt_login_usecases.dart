import 'package:dartz/dartz.dart';
import 'package:hotel_data/features/auth/domain/entities/verfy_otp.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/login_repostitorise.dart';

class CheckUpVerigyOtpLoginUseCases {
  final LoginRepostitory reostitory;
  CheckUpVerigyOtpLoginUseCases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Faiture, VerifyOptLogin>> call(
      {required String mobile, required String otp}) async {
    return await reostitory.checkVerifyOptLogin(mobile: mobile, otp: otp);
  }
}
