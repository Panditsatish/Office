class HomeModal {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  HomeModal({this.statusCode, this.responseData, this.requestParams, this.time});

  HomeModal.fromJson(Map<String, dynamic> json) {
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
  EmployeeProfile? employeeProfile;
  List<DeptDetails>? deptDetails;
  List<DesignationDetails>? designationDetails;
  List<dynamic>? skillDetails;
  List<dynamic>? otherSkillDetails;
  List<dynamic>? projectDetails;
  List<dynamic>? projectsOfManager;

  ResponseData({this.message, this.employeeProfile, this.deptDetails, this.designationDetails, this.skillDetails, this.otherSkillDetails, this.projectDetails, this.projectsOfManager});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    employeeProfile = json['employeeProfile'] != null ?  EmployeeProfile.fromJson(json['employeeProfile']) : null;
    if (json['deptDetails'] != null) {
      deptDetails = <DeptDetails>[];
      json['deptDetails'].forEach((v) { deptDetails!.add( DeptDetails.fromJson(v)); });
    }
    if (json['designationDetails'] != null) {
      designationDetails = <DesignationDetails>[];
      json['designationDetails'].forEach((v) { designationDetails!.add( DesignationDetails.fromJson(v)); });
    }
    if (json['skillDetails'] != null) {
      skillDetails = <Null>[];
      json['skillDetails'].forEach((v) { skillDetails!.add((v)); });
    }
    if (json['otherSkillDetails'] != null) {
      otherSkillDetails = <Null>[];
      json['otherSkillDetails'].forEach((v) { otherSkillDetails!.add((v)); });
    }
    if (json['projectDetails'] != null) {
      projectDetails = <Null>[];
      json['projectDetails'].forEach((v) { projectDetails!.add((v)); });
    }
    if (json['projectsOfManager'] != null) {
      projectsOfManager = <Null>[];
      json['projectsOfManager'].forEach((v) { projectsOfManager!.add((v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.employeeProfile != null) {
      data['employeeProfile'] = this.employeeProfile!.toJson();
    }
    if (this.deptDetails != null) {
      data['deptDetails'] = this.deptDetails!.map((v) => v.toJson()).toList();
    }
    if (this.designationDetails != null) {
      data['designationDetails'] = this.designationDetails!.map((v) => v.toJson()).toList();
    }
    if (this.skillDetails != null) {
      data['skillDetails'] = this.skillDetails!.map((v) => v.toJson()).toList();
    }
    if (this.otherSkillDetails != null) {
      data['otherSkillDetails'] = this.otherSkillDetails!.map((v) => v.toJson()).toList();
    }
    if (this.projectDetails != null) {
      data['projectDetails'] = this.projectDetails!.map((v) => v.toJson()).toList();
    }
    if (this.projectsOfManager != null) {
      data['projectsOfManager'] = this.projectsOfManager!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeProfile {
  String? employeeId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? empId;
  int? gender;
  String? email;
  String? personalEmail;
  String? phone;
  String? alternateMob;
  int? dob;
  int? editRequest;
  int? dateOfJoining;
  dynamic dueAppraisal;
  dynamic experienceYear;
  dynamic experienceMonth;
  CurrentAddress? currentAddress;
  PermanentAddress? permanentAddress;
  PreviousAddress? previousAddress;
  int? walletBalance;
  int? couponWalletBalance;
  List<dynamic>? education;
  List<dynamic>? qualification;
  List<dynamic>? attachedDocs;
  String? profileImage;
  int? status;
  int? isAdmin;
  int? isDelete;

  EmployeeProfile({this.employeeId, this.firstName, this.middleName, this.lastName, this.empId, this.gender, this.email, this.personalEmail, this.phone, this.alternateMob, this.dob, this.editRequest, this.dateOfJoining, this.dueAppraisal, this.experienceYear, this.experienceMonth, this.currentAddress, this.permanentAddress, this.previousAddress, this.walletBalance, this.couponWalletBalance, this.education, this.qualification, this.attachedDocs, this.profileImage, this.status, this.isAdmin, this.isDelete});

  EmployeeProfile.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    empId = json['empId'];
    gender = json['gender'];
    email = json['email'];
    personalEmail = json['personalEmail'];
    phone = json['phone'];
    alternateMob = json['alternateMob'];
    dob = json['dob'];
    editRequest = json['editRequest'];
    dateOfJoining = json['dateOfJoining'];
    dueAppraisal = json['dueAppraisal'];
    experienceYear = json['experienceYear'];
    experienceMonth = json['experienceMonth'];
    currentAddress = json['currentAddress'] != null ? new CurrentAddress.fromJson(json['currentAddress']) : null;
    permanentAddress = json['permanentAddress'] != null ? new PermanentAddress.fromJson(json['permanentAddress']) : null;
    previousAddress = json['previousAddress'] != null ? new PreviousAddress.fromJson(json['previousAddress']) : null;
    walletBalance = json['walletBalance'];
    couponWalletBalance = json['couponWalletBalance'];
    if (json['education'] != null) {
      education = <Null>[];
      json['education'].forEach((v) { education!.add((v)); });
    }
    if (json['qualification'] != null) {
      qualification = <Null>[];
      json['qualification'].forEach((v) { qualification!.add((v)); });
    }
    if (json['attachedDocs'] != null) {
      attachedDocs = <Null>[];
      json['attachedDocs'].forEach((v) { attachedDocs!.add((v)); });
    }
    profileImage = json['profileImage'];
    status = json['status'];
    isAdmin = json['isAdmin'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['empId'] = this.empId;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['personalEmail'] = this.personalEmail;
    data['phone'] = this.phone;
    data['alternateMob'] = this.alternateMob;
    data['dob'] = this.dob;
    data['editRequest'] = this.editRequest;
    data['dateOfJoining'] = this.dateOfJoining;
    data['dueAppraisal'] = this.dueAppraisal;
    data['experienceYear'] = this.experienceYear;
    data['experienceMonth'] = this.experienceMonth;
    if (this.currentAddress != null) {
      data['currentAddress'] = this.currentAddress!.toJson();
    }
    if (this.permanentAddress != null) {
      data['permanentAddress'] = this.permanentAddress!.toJson();
    }
    if (this.previousAddress != null) {
      data['previousAddress'] = this.previousAddress!.toJson();
    }
    data['walletBalance'] = this.walletBalance;
    data['couponWalletBalance'] = this.couponWalletBalance;
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v!.toJson()).toList();
    }
    if (this.qualification != null) {
      data['qualification'] = this.qualification!.map((v) => v!.toJson()).toList();
    }
    if (this.attachedDocs != null) {
      data['attachedDocs'] = this.attachedDocs!.map((v) => v!.toJson()).toList();
    }
    data['profileImage'] = this.profileImage;
    data['status'] = this.status;
    data['isAdmin'] = this.isAdmin;
    data['isDelete'] = this.isDelete;
    return data;
  }
}

class CurrentAddress {
  String? currentAddressOne;
  String? currentAddressTwo;
  String? currentCity;
  String? currentState;
  dynamic currentZip;
  String? currentCountry;

  CurrentAddress({this.currentAddressOne, this.currentAddressTwo, this.currentCity, this.currentState, this.currentZip, this.currentCountry});

  CurrentAddress.fromJson(Map<String, dynamic> json) {
    currentAddressOne = json['currentAddressOne'];
    currentAddressTwo = json['currentAddressTwo'];
    currentCity = json['currentCity'];
    currentState = json['currentState'];
    currentZip = json['currentZip'];
    currentCountry = json['currentCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentAddressOne'] = this.currentAddressOne;
    data['currentAddressTwo'] = this.currentAddressTwo;
    data['currentCity'] = this.currentCity;
    data['currentState'] = this.currentState;
    data['currentZip'] = this.currentZip;
    data['currentCountry'] = this.currentCountry;
    return data;
  }
}

class PermanentAddress {
  String? permanentAddressOne;
  String? permanentAddressTwo;
  String? permanentCity;
  String? permanentState;
  dynamic permanentZip;
  String? permanentCountry;

  PermanentAddress({this.permanentAddressOne, this.permanentAddressTwo, this.permanentCity, this.permanentState, this.permanentZip, this.permanentCountry});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    permanentAddressOne = json['permanentAddressOne'];
    permanentAddressTwo = json['permanentAddressTwo'];
    permanentCity = json['permanentCity'];
    permanentState = json['permanentState'];
    permanentZip = json['permanentZip'];
    permanentCountry = json['permanentCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permanentAddressOne'] = this.permanentAddressOne;
    data['permanentAddressTwo'] = this.permanentAddressTwo;
    data['permanentCity'] = this.permanentCity;
    data['permanentState'] = this.permanentState;
    data['permanentZip'] = this.permanentZip;
    data['permanentCountry'] = this.permanentCountry;
    return data;
  }
}

class PreviousAddress {
  String? previousAddressOne;
  String? previousAddressTwo;
  String? previousCity;
  String? previousState;
  dynamic previousZip;
  String? previousCountry;

  PreviousAddress({this.previousAddressOne, this.previousAddressTwo, this.previousCity, this.previousState, this.previousZip, this.previousCountry});

  PreviousAddress.fromJson(Map<String, dynamic> json) {
    previousAddressOne = json['previousAddressOne'];
    previousAddressTwo = json['previousAddressTwo'];
    previousCity = json['previousCity'];
    previousState = json['previousState'];
    previousZip = json['previousZip'];
    previousCountry = json['previousCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previousAddressOne'] = this.previousAddressOne;
    data['previousAddressTwo'] = this.previousAddressTwo;
    data['previousCity'] = this.previousCity;
    data['previousState'] = this.previousState;
    data['previousZip'] = this.previousZip;
    data['previousCountry'] = this.previousCountry;
    return data;
  }
}

class DeptDetails {
  String? sId;
  String? departmentName;

  DeptDetails({this.sId, this.departmentName});

  DeptDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['departmentName'] = this.departmentName;
    return data;
  }
}

class DesignationDetails {
  String? sId;
  String? designationName;

  DesignationDetails({this.sId, this.designationName});

  DesignationDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    designationName = json['designationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['designationName'] = this.designationName;
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