import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:mob_vender/ui/mobmenu/menumodal.dart';
import 'package:mob_vender/ui/payment/payment_modal.dart';


Future<Payment_Modal> PaymentListApi(String accessToken,
    List<FoodItemList> foodItemList,
    int? totalPrice) async{
  print("access Testing is eerrrooo $accessToken");
  Map<String, dynamic> request = Map<String, dynamic>();
  request.putIfAbsent('foods', () => foodItemList);
  request.putIfAbsent('totalPrice', () => totalPrice);

  print("foodlist ====== >>>>. ${foodItemList.last.foodId.toString()}");
  final response = await https.post(Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/order/create'),
      headers:{
        'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
        'Content-type': 'application/json',
        "accessToken":accessToken,
      },
      body: json.encode(request)
  );

  if (response.statusCode == 200) {
    print('Status ###########  ++++++>>>>>  ${response.statusCode}');

    final data = jsonDecode(response.body);
    ///Wrong way to return response of api
    /// return LoginResponse(status: data["status"], res: null, time: data["time"]);
    print(' Response  ########### ++++++>>>>>  ${data.toString()}');
    Payment_Modal apiResponse = Payment_Modal.fromJson(data);
    print(' Response  ########### ++++++>>>>>  ${apiResponse.toString()}');

    print(' food  OrderId  ########### ++++++>>>>>  ${apiResponse.responseData?.order?.orderId?.toString()}');
    return apiResponse;

  } else {
    throw Exception('Failed to load list');
  }
}