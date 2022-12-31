import 'package:hotel_data/features/auth/domain/entities/verfy_otp.dart';

// ignore: must_be_immutable
class VerifyOptLoginModel extends VerifyOptLogin {
  VerifyOptLoginModel({
    bool? success,
    DataVerifyOptLogin? dataVerifyOptLogin,
    String? message,
  }) : super(
            success: success,
            dataVerifyOptLogin: dataVerifyOptLogin,
            message: message);

  factory VerifyOptLoginModel.fromJson(Map<String, dynamic> json) {
    return VerifyOptLoginModel(
      success: json['success'],
      dataVerifyOptLogin: json['data'] != null
          ? DataVerifyOptLoginModel.fromJson(json['data'])
          : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (dataVerifyOptLogin != null) {
      data['data'] = (dataVerifyOptLogin as DataVerifyOptLoginModel).toJson()
          as DataVerifyOptLoginModel;
    }
    data['message'] = message;
    return data;
  }
}

// ignore: must_be_immutable
class DataVerifyOptLoginModel extends DataVerifyOptLogin {
  DataVerifyOptLoginModel({
    Driver? driver,
    String? token,
  }) : super(driver: driver, token: token);

  factory DataVerifyOptLoginModel.fromJson(Map<String, dynamic> json) {
    return DataVerifyOptLoginModel(
        driver: json['driver'] != null
            ? DriverModel.fromJson(json['driver'])
            : null,
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (driver != null) {
      data['driver'] = (driver as DriverModel).toJson();
    }
    data['token'] = token;
    return data;
  }
}

// ignore: must_be_immutable
class DriverModel extends Driver {
  DriverModel({
    int? id,
    String? name,
    String? lastName,
    String? email,
    String? mobile,
    int? storeId,
    String? avatar,
    String? address,
    int? deliveryCompanyId,
    String? currentLocation,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? phoneOtp,
    List<Shippings>? shippings,
    List<String>? driverRating,
    DeliveryCompany? deliveryCompany,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          email: email,
          mobile: mobile,
          storeId: storeId,
          avatar: avatar,
          address: address,
          deliveryCompanyId: deliveryCompanyId,
          currentLocation: currentLocation,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
          phoneOtp: phoneOtp,
          shippings: shippings,
          driverRating: driverRating,
          deliveryCompany: deliveryCompany,
        );

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    List<ShippingsModel> shippings = <ShippingsModel>[];
    if (json['shippings'] != null) {
      json['shippings'].forEach((value) {
        shippings.add(ShippingsModel.fromJson(value));
      });
    }
    //  List driverRating = [];
    //   if (json['DriverRating'] != null) {

    //     json['DriverRating'].forEach((v) {
    //       driverRating.add( DriverRatingModel.fromJson(v));
    //     });
    //   }

    return DriverModel(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      mobile: json['mobile'],
      storeId: json['storeId'],
      avatar: json['avatar'],
      address: json['address'],
      deliveryCompanyId: json['deliveryCompanyId'],
      currentLocation: json['currentLocation'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      phoneOtp: json['phoneOtp'],
      deliveryCompany: json['deliveryCompany'] != null
          ? DeliveryCompanyModel.fromJson(json['deliveryCompany'])
          : null,
      shippings: shippings,
      driverRating: const [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['storeId'] = storeId;
    data['avatar'] = avatar;
    data['address'] = address;
    data['deliveryCompanyId'] = deliveryCompanyId;
    data['currentLocation'] = currentLocation;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['phoneOtp'] = phoneOtp;
    if (shippings != null) {
      data['shippings'] = shippings!
          .map((value) => (value as ShippingsModel).toJson())
          .toList();
    }
    // if (driverRating != null) {
    //   data['DriverRating'] = driverRating!.map((value) =>(value as DriverModel).toJson()).toList();
    // }
    if (deliveryCompany != null) {
      data['deliveryCompany'] =
          (deliveryCompany as DeliveryCompanyModel).toJson();
    }
    return data;
  }
}

// ignore: must_be_immutable
class ShippingsModel extends Shippings {
  ShippingsModel({
    int? id,
    int? cost,
    String? addressId,
    String? status,
    String? currentLocatrion,
    int? driverId,
    int? deliveryCompanyId,
    int? orderId,
    String? deliveryDate,
    String? deliveryTime,
    String? createdAt,
    String? updatedAt,
    Order? order,
  }) : super(
          id: id,
          cost: cost,
          addressId: addressId,
          status: status,
          currentLocatrion: currentLocatrion,
          driverId: driverId,
          deliveryCompanyId: deliveryCompanyId,
          orderId: orderId,
          deliveryDate: deliveryDate,
          deliveryTime: deliveryTime,
          createdAt: createdAt,
          updatedAt: updatedAt,
          order: order,
        );

  factory ShippingsModel.fromJson(Map<String, dynamic> json) {
    return ShippingsModel(
      id: json['id'],
      cost: json['cost'],
      addressId: json['addressId'],
      status: json['status'],
      currentLocatrion: json['currentLocatrion'],
      driverId: json['driverId'],
      deliveryCompanyId: json['deliveryCompanyId'],
      orderId: json['orderId'],
      deliveryDate: json['deliveryDate'],
      deliveryTime: json['deliveryTime'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      order: json['order'] != null ? OrderModel.fromJson(json['order']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cost'] = cost;
    data['addressId'] = addressId;
    data['status'] = status;
    data['currentLocatrion'] = currentLocatrion;
    data['driverId'] = driverId;
    data['deliveryCompanyId'] = deliveryCompanyId;
    data['orderId'] = orderId;
    data['deliveryDate'] = deliveryDate;
    data['deliveryTime'] = deliveryTime;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (order != null) {
      data['order'] = (order as OrderModel).toJson();
    }
    return data;
  }
}

// ignore: must_be_immutable
class OrderModel extends Order {
  OrderModel({
    int? id,
    String? ref,
    String? orderDate,
    String? status,
    String? messageTo,
    String? messageText,
    int? amount,
    double? tax,
    int? discount,
    String? cuponId,
    int? customerId,
    int? storeId,
    String? type,
    int? addressId,
    List<Products>? products,
    int? deliveryCost,
    String? estimateDate,
    String? estimateTime,
    String? createdAt,
    String? updatedAt,
  }) : super(
          id: id,
          ref: ref,
          orderDate: orderDate,
          status: status,
          messageTo: messageTo,
          messageText: messageText,
          amount: amount,
          tax: tax,
          discount: discount,
          cuponId: cuponId,
          customerId: customerId,
          storeId: storeId,
          type: type,
          addressId: addressId,
          products: products,
          deliveryCost: deliveryCost,
          estimateDate: estimateDate,
          estimateTime: estimateTime,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<Products> products = <Products>[];
    if (json['products'] != null) {
      for (var value in json['products']) {
        products.add(ProductsModel.fromJson(value));
      }
    }
    return OrderModel(
      id: json['id'],
      ref: json['ref'],
      orderDate: json['orderDate'],
      status: json['status'],
      messageTo: json['messageTo'],
      messageText: json['messageText'],
      amount: json['amount'],
      tax: json['tax'],
      discount: json['discount'],
      cuponId: json['cuponId'],
      customerId: json['customerId'],
      storeId: json['storeId'],
      type: json['type'],
      addressId: json['addressId'],
      products: products,
      deliveryCost: json['deliveryCost'],
      estimateDate: json['estimateDate'],
      estimateTime: json['estimateTime'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ref'] = ref;
    data['orderDate'] = orderDate;
    data['status'] = status;
    data['messageTo'] = messageTo;
    data['messageText'] = messageText;
    data['amount'] = amount;
    data['tax'] = tax;
    data['discount'] = discount;
    data['cuponId'] = cuponId;
    data['customerId'] = customerId;
    data['storeId'] = storeId;
    data['type'] = type;
    data['addressId'] = addressId;
    if (products != null) {
      data['products'] =
          products!.map((value) => (value as ProductsModel).toJson()).toList();
    }
    data['deliveryCost'] = deliveryCost;
    data['estimateDate'] = estimateDate;
    data['estimateTime'] = estimateTime;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

// ignore: must_be_immutable
class ProductsModel extends Products {
  ProductsModel({
    required int? price,
    required String? eventId,
    required int? discount,
    required int? quantity,
    required String? eventName,
    required int? productId,
    required int? totalAmount,
  }) : super(
          price: price,
          eventId: eventId,
          discount: discount,
          quantity: quantity,
          eventName: eventName,
          productId: productId,
          totalAmount: totalAmount,
        );

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      price: json['price'],
      eventId: json['eventId'],
      discount: json['discount'],
      quantity: json['quantity'],
      eventName: json['eventName'],
      productId: json['productId'],
      totalAmount: json['totalAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['eventId'] = eventId;
    data['discount'] = discount;
    data['quantity'] = quantity;
    data['eventName'] = eventName;
    data['productId'] = productId;
    data['totalAmount'] = totalAmount;
    return data;
  }
}

// ignore: must_be_immutable
class DeliveryCompanyModel extends DeliveryCompany {
  DeliveryCompanyModel({
    required int? id,
    required String? name,
  }) : super(id: id, name: name);

  factory DeliveryCompanyModel.fromJson(Map<String, dynamic> json) {
    return DeliveryCompanyModel(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
