import 'dart:convert';
import 'package:hotel_data/features/auth/data/models/datalogin_model.dart';
import 'package:hotel_data/features/auth/data/models/verfy_opt_Model.dart';
import '../../../../core/error/exception.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginModel> checkUpLogin(
      {required String mobile, required String password});
  Future<VerifyOptLoginModel> checkVerifyOtpUpLogin(
      {required String mobile, required String otp});
}

// ignore: constant_identifier_names
const BASE_URL = 'https://api.galarose.sa/api/driver/';

class LoginRemoteImplWithHttp extends LoginRemoteDataSource {
  final http.Client client;
  LoginRemoteImplWithHttp({required this.client});
  @override
  Future<LoginModel> checkUpLogin(
      {required String mobile, required String password}) async {
    final resonse = await client.post(Uri.parse(BASE_URL + "login"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"mobile": mobile, "password": password}));
    if (resonse.statusCode == 200) {
      final decodeJson = json.decode(resonse.body);
      final LoginModel loginModel = LoginModel.fromJson(decodeJson);
      print(loginModel.dataLogin!.otp);
      return loginModel;
    } else {
      throw ServerExecption();
    }
  }

  @override
  Future<VerifyOptLoginModel> checkVerifyOtpUpLogin(
      {required String mobile, required String otp}) async {
    final resonse = await client.post(Uri.parse(BASE_URL + "verify-otp"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"mobile": mobile, "otp": otp}));

    if (resonse.statusCode == 200 || resonse.statusCode == 201) {
      final decodeJson = json.decode(resonse.body);
      final VerifyOptLoginModel verifyOptLoginModel =
          VerifyOptLoginModel.fromJson(decodeJson);

      return verifyOptLoginModel;
    } else {
      throw ServerExecption();
    }
  }
}
