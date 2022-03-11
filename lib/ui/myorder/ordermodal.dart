class MyOrderModal {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  MyOrderModal({this.statusCode, this.responseData, this.requestParams, this.time});

  MyOrderModal.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null ? new ResponseData.fromJson(json['responseData']) : null;
    requestParams = json['requestParams'] != null ? new RequestParams.fromJson(json['requestParams']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    if (this.requestParams != null) {
      data['requestParams'] = this.requestParams!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class ResponseData {
  String? message;
  List<OrderList>? orderList;
  List<int>? totalOrders;
  int? isAdmin;
  String? orderSheet;

  ResponseData({this.message, this.orderList, this.totalOrders, this.isAdmin, this.orderSheet});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['orderList'] != null) {
      orderList = <OrderList>[];
      json['orderList'].forEach((v) { orderList!.add(new OrderList.fromJson(v)); });
    }
    totalOrders = json['totalOrders'].cast<int>();
    isAdmin = json['isAdmin'];
    orderSheet = json['orderSheet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.orderList != null) {
      data['orderList'] = this.orderList!.map((v) => v.toJson()).toList();
    }
    data['totalOrders'] = this.totalOrders;
    data['isAdmin'] = this.isAdmin;
    data['orderSheet'] = this.orderSheet;
    return data;
  }
}

class OrderList {
  String? orderId;
  String? employeeId;
  EmployeeName? employeeName;
  String? employeePhone;
  List<Foods>? foods;
  int? totalPrice;
  int? status;
  String? created;
  VendorDetail? vendorDetail;

  OrderList({this.orderId, this.employeeId, this.employeeName, this.employeePhone, this.foods, this.totalPrice, this.status, this.created, this.vendorDetail});

  OrderList.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    employeeId = json['employeeId'];
    employeeName = json['employeeName'] != null ? new EmployeeName.fromJson(json['employeeName']) : null;
    employeePhone = json['employeePhone'];
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) { foods!.add(new Foods.fromJson(v)); });
    }
    totalPrice = json['totalPrice'];
    status = json['status'];
    created = json['created'];
    vendorDetail = json['vendorDetail'] != null ? new VendorDetail.fromJson(json['vendorDetail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['employeeId'] = this.employeeId;
    if (this.employeeName != null) {
      data['employeeName'] = this.employeeName!.toJson();
    }
    data['employeePhone'] = this.employeePhone;
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['created'] = this.created;
    if (this.vendorDetail != null) {
      data['vendorDetail'] = this.vendorDetail!.toJson();
    }
    return data;
  }
}

class EmployeeName {
  String? firstName;
  String? middleName;
  String? lastName;

  EmployeeName({this.firstName, this.middleName, this.lastName});

  EmployeeName.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class Foods {
  String? name;
  int? price;
  dynamic description;
  List<dynamic>? images;
  int? quantity;
  int? total;

  Foods({this.name, this.price, this.description, this.images, this.quantity, this.total});

  Foods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    images = json['images'];
    quantity = json['quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['images'] = this.images;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    return data;
  }
}

class VendorDetail {
  String? vendorId;
  String? name;
  String? phoneNo;
  String? email;

  VendorDetail({this.vendorId, this.name, this.phoneNo, this.email});

  VendorDetail.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendorId'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorId'] = this.vendorId;
    data['name'] = this.name;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    return data;
  }
}

class RequestParams {


  RequestParams();

RequestParams.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}