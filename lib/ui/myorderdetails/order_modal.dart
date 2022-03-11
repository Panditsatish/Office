
class OrderModal {
  int? statusCode;
  Error? error;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  OrderModal({this.statusCode, this.responseData, this.requestParams, this.time});

  OrderModal.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    responseData = json['responseData'] != null ? new ResponseData.fromJson(json['responseData']) : null;
    requestParams = json['requestParams'] != null ? new RequestParams.fromJson(json['requestParams']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
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

class Error {
  int? errorCode;
  String? responseMessage;
  String? errorMessage;

  Error({this.errorCode, this.responseMessage, this.errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    responseMessage = json['responseMessage'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['responseMessage'] = this.responseMessage;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class ResponseData {
  String? message;
  OrderDetail? orderDetail;
  int? isAdmin;

  ResponseData({this.message, this.orderDetail, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    orderDetail = json['orderDetail'] != null ? new OrderDetail.fromJson(json['orderDetail']) : null;
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.orderDetail != null) {
      data['orderDetail'] = this.orderDetail!.toJson();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class OrderDetail {
  String? orderId;
  String? employeeId;
  EmployeeName? employeeName;
  String? employeePhone;
  List<Foods>? foods;
  int? totalPrice;
  int? status;
  String? created;
  VendorDetail? vendorDetail;

  OrderDetail({this.orderId, this.employeeId, this.employeeName, this.employeePhone, this.foods, this.totalPrice, this.status, this.created, this.vendorDetail});

  OrderDetail.fromJson(Map<String, dynamic> json) {
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
  int? quantity;
  int? total;
  String? description;
  List<dynamic>? images;

  Foods({this.name, this.price, this.quantity, this.total, this.description, this.images});

  Foods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    description = json['description'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['description'] = this.description;
    data['images'] = this.images;
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