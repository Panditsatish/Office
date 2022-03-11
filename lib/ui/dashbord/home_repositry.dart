import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dash_modal.dart';

Future<HomeModal> gotoDashApi(String accessToken) async{

  final response =await http.post(Uri.parse('https://hrmapi.mobcoder.com/hrm/api/v1/employee/getMyProfile'),
    body:{
    "accessToken":accessToken,},
    headers:{
      'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ=="

    },
  );
  if (response.statusCode == 200) {

    final data = jsonDecode(response.body);
    ///Wrong way to return response of api
    /*  return LoginResponse(status: data["status"], res: null, time: data["time"]);*/

    HomeModal apiResponse1 = HomeModal.fromJson(data);
    print(" ");
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}


