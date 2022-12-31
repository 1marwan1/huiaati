import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Login extends Equatable {
  bool? success;
  DataLogin? dataLogin;
  String? message;

  Login(
      {required this.success, required this.dataLogin, required this.message});

  @override
  List<Object?> get props => [success, dataLogin, message];
}

abstract class DataLogin {
  DriverAllData? driverAllData;
  String? otp;

  DataLogin({required this.driverAllData, required this.otp});
}

abstract class DriverAllData {
  int? id;
  String? name;
  String? lastName;
  String? email;
  String? mobile;
  int? storeId;
  String? mobileToken;
  String? avatar;
  String? address;
  int? deliveryCompanyId;
  String? currentLocation;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? phoneOtp;

  DriverAllData(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.mobile,
      required this.storeId,
      required this.mobileToken,
      required this.avatar,
      required this.address,
      required this.deliveryCompanyId,
      required this.currentLocation,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.phoneOtp});
}
