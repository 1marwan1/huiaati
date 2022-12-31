import 'package:hotel_data/features/auth/domain/entities/login.dart';

// ignore: must_be_immutable
class LoginModel extends Login {
  LoginModel({
    bool? success,
    DataLoginModel? dataLogin,
    String? message,
  }) : super(success: success, dataLogin: dataLogin, message: message);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      dataLogin:
          json['data'] != null ? DataLoginModel.fromJson(json['data']) : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;

    if (dataLogin != null) {
      data['data'] = (dataLogin as DataLoginModel).toJson();
    }
    data['message'] = message;
    return data;
  }
}

class DataLoginModel extends DataLogin {
  DataLoginModel({
    DriverAllDataModel? driverAllData,
    String? otp,
  }) : super(driverAllData: driverAllData, otp: otp);

  factory DataLoginModel.fromJson(Map<String, dynamic> json) {
    return DataLoginModel(
      driverAllData: json['driverAllData'] != null
          ? DriverAllDataModel.fromJson(json['driverAllData'])
          : null,
      otp: json['otp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataLogin = <String, dynamic>{};
    if (driverAllData != null) {
      dataLogin['driverAllData'] =
          (driverAllData as DriverAllDataModel).toJson() as DriverAllDataModel;
    }
    dataLogin['otp'] = otp;

    return dataLogin;
  }
}

class DriverAllDataModel extends DriverAllData {
  DriverAllDataModel({
    int? id,
    String? name,
    String? lastName,
    String? email,
    String? mobile,
    int? storeId,
    String? mobileToken,
    String? avatar,
    String? address,
    int? deliveryCompanyId,
    String? currentLocation,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? phoneOtp,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          email: email,
          mobile: mobile,
          storeId: storeId,
          mobileToken: mobileToken,
          avatar: avatar,
          address: address,
          deliveryCompanyId: deliveryCompanyId,
          currentLocation: currentLocation,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
          phoneOtp: phoneOtp,
        );

  factory DriverAllDataModel.fromJson(Map<String, dynamic> json) {
    return DriverAllDataModel(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      mobile: json['mobile'],
      storeId: json['storeId'],
      mobileToken: json['mobileToken'],
      avatar: json['avatar'],
      address: json['address'],
      deliveryCompanyId: json['deliveryCompanyId'],
      currentLocation: json['currentLocation'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      phoneOtp: json['phoneOtp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataLogin = <String, dynamic>{};
    dataLogin['id'] = id;
    dataLogin['name'] = name;
    dataLogin['lastName'] = lastName;
    dataLogin['email'] = email;
    dataLogin['mobile'] = mobile;
    dataLogin['storeId'] = storeId;
    dataLogin['mobileToken'] = mobileToken;
    dataLogin['avatar'] = avatar;
    dataLogin['address'] = address;
    dataLogin['deliveryCompanyId'] = deliveryCompanyId;
    dataLogin['currentLocation'] = currentLocation;
    dataLogin['status'] = status;
    dataLogin['createdAt'] = createdAt;
    dataLogin['updatedAt'] = updatedAt;
    dataLogin['phoneOtp'] = phoneOtp;
    return dataLogin;
  }
}
