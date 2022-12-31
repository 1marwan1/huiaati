import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class VerifyOptLogin extends Equatable {
  bool? success;
  DataVerifyOptLogin? dataVerifyOptLogin;
  String? message;

  VerifyOptLogin(
      {required this.success, this.dataVerifyOptLogin, required this.message});

  @override
  List<Object> get props => [success!, dataVerifyOptLogin!, message!];
}

// ignore: must_be_immutable
abstract class DataVerifyOptLogin extends Equatable {
  Driver? driver;
  String? token;

  DataVerifyOptLogin({this.driver, this.token});
  @override
  List<Object> get props => [driver!, token!];
}

// ignore: must_be_immutable
abstract class Driver extends Equatable {
  int? id;
  String? name;
  String? lastName;
  String? email;
  String? mobile;
  int? storeId;
  String? avatar;
  String? address;
  int? deliveryCompanyId;
  String? currentLocation;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? phoneOtp;
  List<Shippings>? shippings;
  List<String>? driverRating;
  DeliveryCompany? deliveryCompany;

  Driver(
      {this.id,
      this.name,
      this.lastName,
      this.email,
      this.mobile,
      this.storeId,
      this.avatar,
      this.address,
      this.deliveryCompanyId,
      this.currentLocation,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.phoneOtp,
      this.shippings,
      this.driverRating,
      this.deliveryCompany});
  @override
  List<Object> get props => [
        id!,
        name!,
        lastName!,
        email!,
        mobile!,
        storeId!,
        avatar!,
        address!,
        deliveryCompanyId!,
        currentLocation!,
        status!,
        createdAt!,
        updatedAt!,
        phoneOtp!,
        shippings!,
        driverRating!,
        deliveryCompany!
      ];
}

// ignore: must_be_immutable
abstract class Shippings extends Equatable {
  int? id;
  int? cost;
  String? addressId;
  String? status;
  String? currentLocatrion;
  int? driverId;
  int? deliveryCompanyId;
  int? orderId;
  String? deliveryDate;
  String? deliveryTime;
  String? createdAt;
  String? updatedAt;
  Order? order;

  Shippings(
      {this.id,
      this.cost,
      this.addressId,
      this.status,
      this.currentLocatrion,
      this.driverId,
      this.deliveryCompanyId,
      this.orderId,
      this.deliveryDate,
      this.deliveryTime,
      this.createdAt,
      this.updatedAt,
      this.order});

  @override
  List<Object> get props => [
        id!,
        cost!,
        addressId!,
        status!,
        currentLocatrion!,
        driverId!,
        deliveryCompanyId!,
        orderId!,
        deliveryDate!,
        deliveryTime!,
        createdAt!,
        updatedAt!,
        order!
      ];
}

// ignore: must_be_immutable
abstract class Order extends Equatable {
  int? id;
  String? ref;
  String? orderDate;
  String? status;
  String? messageTo;
  String? messageText;
  int? amount;
  double? tax;
  int? discount;
  String? cuponId;
  int? customerId;
  int? storeId;
  String? type;
  int? addressId;
  List<Products>? products;
  int? deliveryCost;
  String? estimateDate;
  String? estimateTime;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
      this.ref,
      this.orderDate,
      this.status,
      this.messageTo,
      this.messageText,
      this.amount,
      this.tax,
      this.discount,
      this.cuponId,
      this.customerId,
      this.storeId,
      this.type,
      this.addressId,
      this.products,
      this.deliveryCost,
      this.estimateDate,
      this.estimateTime,
      this.createdAt,
      this.updatedAt});
  @override
  List<Object> get props => [
        id!,
        ref!,
        orderDate!,
        status!,
        messageTo!,
        messageText!,
        amount!,
        tax!,
        discount!,
        cuponId!,
        customerId!,
        storeId!,
        type!,
        addressId!,
        products!,
        deliveryCost!,
        estimateDate!,
        estimateTime!,
        createdAt!,
        updatedAt!
      ];
}

// ignore: must_be_immutable
abstract class Products extends Equatable {
  int? price;
  String? eventId;
  int? discount;
  int? quantity;
  String? eventName;
  int? productId;
  int? totalAmount;

  Products(
      {this.price,
      this.eventId,
      this.discount,
      this.quantity,
      this.eventName,
      this.productId,
      this.totalAmount});
  @override
  List<Object> get props => [
        price!,
        eventId!,
        discount!,
        quantity!,
        eventName!,
        productId!,
        totalAmount!
      ];
}

// ignore: must_be_immutable
abstract class DeliveryCompany extends Equatable {
  int? id;
  String? name;

  DeliveryCompany({this.id, this.name});
  @override
  List<Object> get props => [id!, name!];
}
