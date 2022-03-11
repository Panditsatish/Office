class Payment_Modal {
  int? statusCode;
  Error? error;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  Payment_Modal(
      {this.statusCode, this.error, this.responseData, this.requestParams, this.time});

  Payment_Modal.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;

    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
    requestParams = json['requestParams'] != null
        ? new RequestParams.fromJson(json['requestParams'])
        : null;
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
  Order? order;
  int? isAdmin;

  ResponseData({this.message, this.order, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class Order {
  String? orderId;
  String? employeeId;
  List<Foods>? foods;
  int? totalPrice;
  int? status;
  String? created;

  Order(
      {this.orderId,
        this.employeeId,
        this.foods,
        this.totalPrice,
        this.status,
        this.created});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    employeeId = json['employeeId'];
    if (json['foods'] != null) {
      foods =  <Foods>[];
      json['foods'].forEach((v) {
        foods!.add(new Foods.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    status = json['status'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['employeeId'] = this.employeeId;
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['created'] = this.created;
    return data;
  }
}

class RequestParams {
  List<Foods>? foods;
  int? totalPrice;

  RequestParams({this.foods, this.totalPrice});

  RequestParams.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {

        foods!.add(new Foods.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class Foods {
  String? sId;
  String? foodId;
  String? name;
  int? price;
  int? quantity;
  int? total;

  Foods(
      {this.sId,
        this.foodId,
        this.name,
        this.price,
        this.quantity,
        this.total});

  Foods.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    foodId = json['foodId'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['foodId'] = this.foodId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    return data;
  }
}

