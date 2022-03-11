class VendorModal {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  VendorModal({this.statusCode, this.responseData, this.requestParams, this.time});

  VendorModal.fromJson(Map<String, dynamic> json) {
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
  List<VendorList>? vendorList;
  int? isAdmin;

  ResponseData({this.message, this.vendorList, this.isAdmin});
  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['vendorList'] != null) {
      vendorList =  <VendorList>[];
      json['vendorList'].forEach((v) { vendorList!.add(VendorList.fromJson(v)); });
    }
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.vendorList != null) {
      data['vendorList'] = this.vendorList!.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class VendorList {
  String? vendorId;
  String? name;
  String? phoneNo;
  String? email;
  String? image;
  String? aboutUs;

  VendorList({this.vendorId, this.name, this.phoneNo, this.email, this.image, this.aboutUs});

  VendorList.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendorId'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    image = json['image'];
    aboutUs = json['aboutUs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['vendorId'] = this.vendorId;
    data['name'] = this.name;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.email;
    data['image'] = this.image;
    data['aboutUs'] = this.aboutUs;
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