class LoginModal {
  int? statusCode;
  Error? error;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  LoginModal(
      {this.statusCode, this.responseData,this.error, this.requestParams, this.time});

  LoginModal.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    requestParams = json['requestParams'] != null
        ? new RequestParams.fromJson(json['requestParams'])
        : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
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
  EmployeeProfile? employeeProfile;
  int? isAdmin;
  int? isProjectManager;
  int? isDeviceManager;

  ResponseData(
      {this.message,
        this.employeeProfile,
        this.isAdmin,
        this.isProjectManager,
        this.isDeviceManager});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    employeeProfile = json['employeeProfile'] != null
        ? new EmployeeProfile.fromJson(json['employeeProfile'])
        : null;
    isAdmin = json['isAdmin'];
    isProjectManager = json['isProjectManager'];
    isDeviceManager = json['isDeviceManager'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.employeeProfile != null) {
      data['employeeProfile'] = this.employeeProfile!.toJson();
    }
    data['isAdmin'] = this.isAdmin;
    data['isProjectManager'] = this.isProjectManager;
    data['isDeviceManager'] = this.isDeviceManager;
    return data;
  }
}

class EmployeeProfile {
  String? acessToken;
  String? accessToken;
  String? employeeId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? empId;
  String? email;
  String? personalEmail;
  int? gender;
  String? phone;
  int? dob;
  dynamic experienceYear;
  dynamic experienceMonth;
  int? doj;
  List<dynamic>? education;
  List<dynamic>? qualification;
  int? status;
  String? profileImage;
  int? isDelete;

  EmployeeProfile(
      {this.acessToken,
        this.accessToken,
        this.employeeId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.empId,
        this.email,
        this.personalEmail,
        this.gender,
        this.phone,
        this.dob,
        this.experienceYear,
        this.experienceMonth,
        this.doj,
        this.education,
        this.qualification,
        this.status,
        this.profileImage,
        this.isDelete});

  EmployeeProfile.fromJson(Map<String, dynamic> json) {
    acessToken = json['acessToken'];
    accessToken = json['accessToken'];
    employeeId = json['employeeId'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    empId = json['empId'];
    email = json['email'];
    personalEmail = json['personalEmail'];
    gender = json['gender'];
    phone = json['phone'];
    dob = json['dob'];
    experienceYear = json['experienceYear'];
    experienceMonth = json['experienceMonth'];
    doj = json['doj'];
    if (json['education'] != null) {
      education =  <dynamic>[];
      json['education'].forEach((v) {
        education!.add( (v));
      });
    }
    if (json['qualification'] != null) {
      qualification =  <dynamic>[];
      json['qualification'].forEach((v) {
        qualification!.add((v));
      });
    }
    status = json['status'];
    profileImage = json['profileImage'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acessToken'] = this.acessToken;
    data['accessToken'] = this.accessToken;
    data['employeeId'] = this.employeeId;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['empId'] = this.empId;
    data['email'] = this.email;
    data['personalEmail'] = this.personalEmail;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['experienceYear'] = this.experienceYear;
    data['experienceMonth'] = this.experienceMonth;
    data['doj'] = this.doj;
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v.toJson()).toList();
    }
    if (this.qualification != null) {
      data['qualification'] =
          this.qualification!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['profileImage'] = this.profileImage;
    data['isDelete'] = this.isDelete;
    return data;
  }
}


class RequestParams {
  String? email;
  String? password;

  RequestParams({this.email, this.password});

  RequestParams.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}