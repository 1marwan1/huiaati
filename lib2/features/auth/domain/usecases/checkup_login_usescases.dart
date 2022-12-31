import 'package:dartz/dartz.dart';
import 'package:hotel_data/features/auth/domain/entities/login.dart';

import '../../../../core/error/faiture.dart';
import '../repositories/login_repostitorise.dart';

class CheckUpLoginUseCases {
  final LoginRepostitory reostitory;
  CheckUpLoginUseCases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Faiture, Login>> call(
      {required String mobile, required String password}) async {
    return await reostitory.checkUpLogin(mobile: mobile, password: password);
  }
}
