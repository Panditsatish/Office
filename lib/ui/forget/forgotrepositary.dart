import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mob_vender/ui/login/loginmodal.dart';

Future<LoginModal> gotoLoginApi(String email,String devTkn) async{

  final response =await http.post(Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/forgotPassword'),
    body:{
      "devTkn":devTkn,"email":email},
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
    print('------------>>>>>>  $access');
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}

