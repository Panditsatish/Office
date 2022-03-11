import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as https;
import 'package:mob_vender/ui/mobmenu/menumodal.dart';
import 'package:mob_vender/ui/myorderdetails/order_details.dart';
import 'package:mob_vender/ui/payment/payment_modal.dart';

class PaymentDetailsUi extends StatefulWidget {
  final String  accessToken;
  final int?  item;
  final int? totalPrice;
final List<FoodItemList> foodItemList;
  const PaymentDetailsUi({Key? key,required this.accessToken,
    required this.item,required this.totalPrice, required this.foodItemList}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}
class _AboutUsState extends State<PaymentDetailsUi> {


  bool isCheck  =false;
  bool isLoader=false;
  int check=0;
  Payment_Modal paymentDetails = Payment_Modal();


  change(bool isCheck) async{
    if(isCheck == true)await{
      print("  Testing ---------->>>>>>.  $isCheck"),
      Navigator.of(context).pop(),
    };
  }

  void _loaderState() {
    setState(() {
      isLoader = true;
    });
  }

  Future<Payment_Modal> apiCall() async {

    String accessToken1= widget.accessToken.toString();
    print('myOrder AccessToke 00000000 $accessToken1');
    List<FoodItemList>? food1= widget.foodItemList;
    print("===========>>>>>>> ${food1.length.toString()} food1");
    print('myOrder AccessToke 00000000 $accessToken1');

    Payment_Modal paymentDetails = await  PaymentListApi(
        widget.accessToken,
        widget.foodItemList,
        widget.totalPrice);
    setState(() {
    });
    return paymentDetails;

  }
  @override
  Widget build(BuildContext context) {
    print('length of list ==>>>.. ${widget.foodItemList.length}');

    List<FoodItemList>? food1= widget.foodItemList;
    print(" food1 ===========>>>>>>> $food1");

    var item=widget.foodItemList;

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/images/ic_splash.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                /* Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBord(loginModal: null,)));
                            */  },
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: 70.w,
                          ),
                          Text("Payment Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'an',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ],
                      ),

                      Container(
                        margin:EdgeInsets.only(left: 10.w,right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Product Item",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'an',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18)),
                            Text("${widget.item} Item",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'an',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18)),
                          ],
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(left: 10.w,right: 10.w,top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'an',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            Text("₹${widget.totalPrice}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'an',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Wrap(
                              children: List.generate(
                                  item.length,
                                      (index) => Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 50.w,
                                                height: 45.h,
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      2.0),
                                                  child: Image.network('${item.elementAt(index).images?[0] ??
                                                      "https://media.istockphoto.com/photos/mug-on-plate-filled-with-coffee-surrounded-by-coffee-beans-picture-id157528129"}',fit: BoxFit.fill,),
                                                ),

                                              ),

                                              Container(
                                                margin: EdgeInsets.only(left: 15.w),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${item.elementAt(index).name}",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'an',
                                                          fontWeight:
                                                          FontWeight
                                                              .w400),
                                                    ),
                                        /*if(foods.contains(widget.foodItemList.elementAt(index)))
                                          foods.add(widget.foodItemList ?? Foods()),*/
                                                    Text('₹${item.elementAt(index).price}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .w700,
                                                          fontSize:
                                                          15,

                                                          color: Colors.black,)),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: '${item.elementAt(index).quantity} Item |',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily: 'an',
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500),
                                                        children:  <
                                                            TextSpan>[
                                                          TextSpan(
                                                            text: ' ₹${item.elementAt(index).total}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize:
                                                              12,
                                                              color: Colors.black,),)
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 35.w,right: 35.w,top: 15.h,bottom: 10.h),
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.black
                        ),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                              onPressed: () async {
                                print("aszdxfcgvbhaszdxfcgv");
                                _loaderState();

                                Payment_Modal response  =   await apiCall();
                                print(" 888888   ${response.statusCode}");

                                if(response.statusCode == 1 ){
                                  isLoader=false;
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                                      OrderDetails( accessToken: '${widget.accessToken}',
                                        orderId: response.responseData!.order!.orderId!)));
                                }else if(response.error?.errorCode == 31){
                                  isLoader=false;
                                  showToast('${response.error?.errorMessage.toString()}',
                                    textStyle: TextStyle(color: Colors.black),
                                    context: context,
                                    backgroundColor: Colors.white,
                                    animation: StyledToastAnimation.scale,
                                    reverseAnimation: StyledToastAnimation.fade,
                                    position: StyledToastPosition.center,
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    animDuration: Duration(seconds: 1),
                                    duration: Duration(seconds: 2),
                                    curve: Curves.elasticOut,
                                    reverseCurve: Curves.linear,
                                  );
                                }
                                print("ending");


                              },
                              child: Text(
                                'Please Order',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.w),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 35.w,right: 35.w,bottom: 15.w),
                        width: MediaQuery.of(context).size.width,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color(0xff6c1a01)
                        ),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title:  Text('Dexter'),
                                    content:  Text('Are you sure, you want to cancel this payment?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () { Navigator.of(context).pop('${isCheck = false}');
                                        print("False ---------->>>>>>.  $isCheck");
                                        },
                                        child:  Text('NO',style: TextStyle(color:Colors.black),),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop( '${isCheck = true}');
                                          print("---------->>>>>>.  $isCheck");
                                          change(isCheck);
                                          } ,
                                        child:  Text('YES',style: TextStyle(color:Colors.black)),
                                      ),
                                    ],
                                  ),
                                );
                                print("  1234565432 Testing ---------->>>>>>.  $isCheck");
                                   },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.w),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isLoader  ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(.5),

                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Stack(alignment: Alignment.center, children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Color(0xff6C1B03),
                            backgroundColor: Color(0xff9a5742),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/ic_kict_1.png',
                              height: 45,
                              width: 45,
                            ))
                      ])
                  ),
                ):Container(),
              ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Future<Payment_Modal> PaymentListApi(String accessToken,
 List<FoodItemList>? foodItemList,
 int? totalPrice) async{
  print("access Testing is eerrrooo $accessToken");
  print("access Testing is total ${foodItemList?.last.total}");
  print("access Testing is quantity ${foodItemList?.last.quantity}");
  Map<String, dynamic> request = Map<String, dynamic>();
  request.putIfAbsent('foods', () => jsonDecode(jsonEncode(foodItemList)));
  request.putIfAbsent('totalPrice', () => totalPrice);
  print("$request");

  print("foodlist ====== >>>>. ${foodItemList?.last.foodId.toString()}");
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