import 'dart:convert';
import 'package:http/http.dart' as http;
import 'loginmodal.dart';

Future<LoginModal> gotoLoginApi(String email,String password,String devTkn) async{
  
  final response =await http.post(Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/login'),
  body:{
    "devTkn":devTkn,"email":email,"password":password},
      headers:{
    'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ=="
  },
  );
  if (response.statusCode == 200) {

    final data = jsonDecode(response.body);
    ///Wrong way to return response of api
    /*  return LoginResponse(status: data["status"], res: null, time: data["time"]);*/

    LoginModal apiResponse1 = LoginModal.fromJson(data);
    String? access=apiResponse1.responseData?.employeeProfile?.accessToken.toString();

    String? msg=apiResponse1.error?.errorMessage.toString();
    print('object');
    print('message    ------------>>>>>>  ${apiResponse1.responseData.toString()}');

    print('message    ------------>>>>>>  ${data.toString()}');
    print('------------>>>>>>  $access');
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}

