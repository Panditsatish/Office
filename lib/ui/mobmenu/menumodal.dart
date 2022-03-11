class MenuModal {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  MenuModal({this.statusCode, this.responseData, this.requestParams, this.time});

  MenuModal.fromJson(Map<String, dynamic> json) {
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
  List<FoodItemList>? foodItemList;
  int? isAdmin;

  ResponseData({this.message, this.foodItemList, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['foodItemList'] != null) {
      foodItemList =  <FoodItemList>[];
      json['foodItemList'].forEach((v) { foodItemList!.add( FoodItemList.fromJson(v)); });
    }
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.foodItemList != null) {
      data['foodItemList'] = this.foodItemList!.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class FoodItemList {
  String? name;
  String? foodId;
  int? price;
  int quantity =0 ;
  int total = 0;
  bool visible=false;
  int? status;
  String? description;
  int? isAvailable;
  int? availableQuantity;
  VendorDetail? vendorDetail;
  int? isDeleted;
  List<dynamic>? images;
  FoodItemList({this.name, this.foodId, this.price, this.status, this.description, this.isAvailable, this.availableQuantity, this.vendorDetail, this.isDeleted, this.images});

  FoodItemList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    foodId = json['foodId'];
    price = json['price'];
    quantity = json['quantity'] ?? 0;
    total = json['total'] ?? 0;
    status = json['status'];
    description = json['description'];
    isAvailable = json['isAvailable'];
    availableQuantity = json['availableQuantity'];
    vendorDetail = json['vendorDetail'] != null ?  VendorDetail.fromJson(json['vendorDetail']) : null;
    isDeleted = json['isDeleted'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['foodId'] = this.foodId;
    data['price'] = this.price;
    if(this.total > 0) {
      data['total'] = this.total;
    }
    if(this.quantity > 0) {
      data['quantity'] = this.quantity;
    }
    data['status'] = this.status;
    data['description'] = this.description;
    data['isAvailable'] = this.isAvailable;
    data['availableQuantity'] = this.availableQuantity;
    if (this.vendorDetail != null) {
      data['vendorDetail'] = this.vendorDetail!.toJson();
    }
    data['isDeleted'] = this.isDeleted;
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


