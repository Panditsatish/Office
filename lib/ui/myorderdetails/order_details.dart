import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mob_vender/ui/mobmenu/menumodal.dart';
import 'package:mob_vender/ui/payment/payment_modal.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

import '../common_class.dart';
import 'order_modal.dart';
import 'package:http/http.dart' as https;



class OrderDetails extends StatefulWidget {
  final String accessToken;
  final String orderId;
/*  final String amount;
  final int  item;*/



   OrderDetails({Key? key,required this.accessToken,
     required this.orderId,

    // required this.amount,required this.foodList , required this.item
   }) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}


enum SingingCharacter { Pending, Accepted,Completed,Cancelled_By_Vendor,Cancelled_By_user }
class _AboutUsState extends State<OrderDetails> {

  bool isCheck  =false;
  bool isVisible=true;

  change(bool isCheck) async{
    if(isCheck == true)await{
      print("  Testing ---------->>>>>>.  $isCheck"),

      Navigator.of(context).pop(),

    };

  }

  OrderModal OrderList= OrderModal();

 bool isLoader = false;


  void _loaderState() {
    setState(() {
      isLoader = true;
    });
  }
  void _visibleWidget() {
    setState(() {
      isVisible = false;
    });
  }

  @override
  initState()  {
    super.initState();
    setState(() {});
    _loaderState();
     OrderApiCall();
    }



  Future<OrderModal> OrderApiCall() async {

    String accessToken1= widget.accessToken;
    String? orderId= widget.orderId;
    print('myOrder AccessToke 00000000 $accessToken1');
    print('myOrder orderId ###########    ${orderId.toString()}');
    OrderList = await  OrderByIdApi('$accessToken1','$orderId') ;
    print('massage length ###########    ${OrderList.responseData?.message?.length.toString()}');
    setState(() {});
    isLoader=false;
    return OrderList;
  }


  Future<OrderModal> apiCall() async {

    String accessToken1= widget.accessToken;
    String? orderId= OrderList.responseData?.orderDetail?.orderId!;
    print('myOrder AccessToke 00000000 $accessToken1');
    print('myOrder orderId ###########    ${orderId.toString()}');
    OrderList = await  OrderDeleteApi('$accessToken1','$orderId') ;
    print('massage length ###########    ${OrderList.responseData?.message?.length.toString()}');
    setState(() {});
    return OrderList;


  }
  @override
  Widget build(BuildContext context){
    final df =  DateFormat('EE,dd MMM yyyy, hh:mma');
    // TimeZoneOffset time1 = timeZoneOffset: 5:30:00.000000;
    // final df =  DateFormat('EE,dd MMM yyyy, hh:mma').parseUtc(time).timeZoneOffset;
    // var time=widget.paymentDetails_modal.time.toString();
    // var dateUtc = DateTime.now().toUtc();
    // print("dateUtc: $dateUtc");
    // 2019-10-10 12:05:01
   // convert it to local
   // var dateLocal = dateUtc.toLocal();
   // print("local: $dateLocal");
   // print(time);
   // print(df.format( DateTime.fromMillisecondsSinceEpoch(time*1000)));
   // print(df.format( DateTime.parse(time).toLocal()));
   // print(df.format(DateTime.now().toLocal()));
   // int? length = widget.paymentDetails_modal.responseData?.order?.foods?.length;
    int? length= OrderList.responseData?.orderDetail?.foods?.length;
    //widget.foodList.length;
    return
     MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child:
            Center(
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/images/ic_splash.png',
                    fit: BoxFit.fill,
                  ),
                ),
                length == null || isLoader ?
                Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(.4),
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
                                // valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                              ),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/ic_kict_1.png',
                                  height: 45,
                                  width: 45,
                                ))
                          ])),
                    )
                  :Container(
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
                                },
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: 70.w,
                          ),
                          Text("Order Detail",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'an',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ],
                      ),

                      Container(
                        margin:EdgeInsets.only(left: 10.w,right: 10.w),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xff884935)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 30.w,
                                    height: 25.h,
                                    margin: EdgeInsets.only(right: 10.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10.00),
                                        color: Color(0xff884935)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.asset(
                                        'assets/images/ic_my_order.png',
                                        color: Colors.white,
                                      ),
                                    ),),
                                  OrderList.responseData?.orderDetail?.status == null ? Text("--",
                                      style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'an',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.h)):
                                  Text(setStatusType(OrderList.responseData?.orderDetail?.status),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.h)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              //${widget.paymentDetails_modal.time.toString()}
                              child: Text(
                                  OrderList.responseData?.orderDetail?.created ==null?"":dateConverter(DateTime.parse(OrderList.responseData!.orderDetail!.created!))
                                  ,style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'an',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.h)),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      OrderList.responseData?.orderDetail?.status != 1
                          ? Container():
                      Visibility(
                        visible: isVisible,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text('Scan QR to Vendor',style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'an',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.h)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  color: Colors.white,
                                  width: 135.w,
                                  height: 125.h,
                                  child: QrImage(
                                    data: '${OrderList.responseData?.orderDetail?.orderId}',//'/*${widget.item}*/',
                                    version: QrVersions.auto,
                                    size: 320,
                                    gapless: false,
                                    embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
                                    embeddedImageStyle: QrEmbeddedImageStyle(
                                      size: Size(80, 80),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),


                   Flexible(
                        fit: FlexFit.loose,
                        child:OrderList.responseData?.orderDetail?.orderId == null ? Container(height: 5):
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Wrap(
                              children: List.generate(length,
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
                                                  /*${widget.foodList?.elementAt(index).images![0]}??*/
                                                  child:OrderList.responseData?.orderDetail?.foods?.elementAt(index).images![0] == null ?
                                                  Image.network(" https://media.istockphoto.com/photos/mug-on-plate-filled-with-coffee-surrounded-by-coffee-beans-picture-id157528129",
                                                      fit: BoxFit.fill):
                                                  Image.network("${OrderList.responseData?.orderDetail?.foods?.elementAt(index).images![0] ?? " "}"
                                                      ,fit: BoxFit.fill),
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
                                                     '${OrderList.responseData?.orderDetail?.foods?.elementAt(index).name ?? ""}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'an',
                                                          fontWeight:
                                                          FontWeight
                                                              .w400),
                                                    ),
                                                    Text(
                                                      //${widget.foodList?.elementAt(index).price}
                                                      //${items?.elementAt(index).price}

                                                        '${OrderList.responseData?.orderDetail?.foods?.elementAt(index).price ?? ""}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .w700,
                                                          fontSize:
                                                          15,

                                                          color: Colors.black,)),
                                                    RichText(
                                                      text: TextSpan(//${items!.elementAt(index).quantity}
                                                        //${widget.foodList?.elementAt(index).quantity}
                                                        text: '${OrderList.responseData?.orderDetail?.foods?.elementAt(index).quantity ?? ""} Item |',
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
                                                            //${items!.elementAt(index).total}
                                                            //${widget.foodList?.elementAt(index).total}
                                                            text: '\b\b₹${OrderList.responseData?.orderDetail?.foods?.elementAt(index).total ?? ""}',
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

                      Card(
                        child: Padding(
                          padding:  EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ordered By",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),
                                  Text("${OrderList.responseData?.orderDetail?.employeeName?.firstName ?? "--"} "
                                      " ${OrderList.responseData?.orderDetail?.employeeName?.lastName ?? ""}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Product Item",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),
                                  OrderList.responseData?.orderDetail?.foods?.length == null ? Text("--"):
                                  Text("${OrderList.responseData?.orderDetail?.foods?.length} Item",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("User Contact",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),

                                  Text("${OrderList.responseData?.orderDetail?.employeePhone ?? "--"}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order ID",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),
                                  Text("${OrderList.responseData?.orderDetail?.orderId ?? "--"}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ordered Status",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),
                                 // int res=setStatus(widget.paymentDetails_modal.responseData?.order?.status?.toInt(),
                                  Text(setStatus(OrderList.responseData?.orderDetail?.status ) ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Amount",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13)),
                                  OrderList.responseData?.orderDetail?.totalPrice == null ? Text(" "): Text(
                                      //${widget.amount}
                                      "₹${OrderList.responseData?.orderDetail?.totalPrice ?? "--"}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'an',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ],
                              ),
                            ],

                          ),
                        ),
                      ),
                      OrderList.responseData?.orderDetail?.status != 1 ? Container(height: 5):
                      Visibility(
                        visible: isVisible,
                        child: Container(
                          margin: EdgeInsets.only(left: 35.w,right: 35.w,bottom: 15.w,top: 5.h),
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
                                onPressed: () async{
                                  _loaderState();
                                  OrderModal response = await   apiCall();
                                  if(response.statusCode ==1){
                                    _visibleWidget();
                                    OrderModal response1= await OrderApiCall();
                                    if(response1.statusCode ==1)
                                      isLoader=false;
                                   // Navigator.pop(context);
                                  }else{
                                    isLoader=false;
                                    showToast('${response.error?.errorMessage.toString()}',
                                      textStyle: TextStyle(color: Colors.black),
                                      context: context,
                                      backgroundColor: Colors.grey,
                                      animation: StyledToastAnimation.scale,
                                      reverseAnimation: StyledToastAnimation.fade,
                                      position: StyledToastPosition.bottom,
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                      animDuration: Duration(seconds: 1),
                                      duration: Duration(seconds: 3),
                                      curve: Curves.elasticOut,
                                      reverseCurve: Curves.linear,
                                    );
                                  }
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
                      ),
                    ],
                  ),
                ),
              ]
              ),
            ),
          ),
        ),
      );
  }
}



Future<OrderModal> OrderDeleteApi(String accessToken,String orderId) async{
  print("access Testing is Access $accessToken");
  print(" Testing orderId $orderId");
/*  Map<String, String> request = Map<String, String>();
  request.putIfAbsent('orderId', () => orderId);*/
 // print("request ############  $request");
  var query={
    'orderId':orderId
  };

  var uri=Uri.https('devhrmapi.mobcoder.com','/hrm/api/v1/order/cancelOrder',query);

  final response = await https.put(uri,


    headers:{
      'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken":accessToken,
    },
  );
  /*final response = await https.put(Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/order/cancelOrder',),


    headers:{
      'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken":accessToken,

    },
      body: json.encode(request)

  );*/
  if (response.statusCode == 200) {

    final data = jsonDecode(response.body);
    ///Wrong way to return response of api
     // return LoginResponse(status: data["status"], res: null, time: data["time"]);
    print('DAta 999999999999 cancelOrder ++++++>>>>>  ${data}');
    OrderModal apiResponse1 = OrderModal.fromJson(data);
    print('statusCode cancelOrder ++++++>>>>>  ${apiResponse1.statusCode}');
    print('orderId cancelOrder ++++++>>>>>  ${apiResponse1.responseData?.orderDetail?.orderId.toString()}');
    return apiResponse1;

  } else if(response.statusCode == 401){
    print("error fount in 401");
    throw Exception('error fount in 401');
  }
  else {
    throw Exception('Failed to api hit');
  }
}


Future<OrderModal> OrderByIdApi(String accessToken,String orderId) async{
  print("access Testing is Access $accessToken");
  print(" Testing orderId $orderId");
/*  Map<String, String> request = Map<String, String>();
  request.putIfAbsent('orderId', () => orderId);*/
  // print("request ############  $request");
  var query={
    'orderId':orderId
  };
//https://devhrmapi.mobcoder.com/hrm/api/v1/order/orderById
  var uri=Uri.https('devhrmapi.mobcoder.com','/hrm/api/v1/order/orderById',query);

  final response = await https.get(uri,


    headers:{
      'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken":accessToken,
    },
  );
  /*final response = await https.put(Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/order/cancelOrder',),


    headers:{
      'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken":accessToken,

    },
      body: json.encode(request)

  );*/
  if (response.statusCode == 200) {

    final data = jsonDecode(response.body);
    ///Wrong way to return response of api
    // return LoginResponse(status: data["status"], res: null, time: data["time"]);
    print('DAta 999999999999  ++++++>>>>>  ${data}');
    OrderModal apiResponse1 = OrderModal.fromJson(data);
    print('statusCode orderById ++++++>>>>>  ${apiResponse1.statusCode}');
    print('orderId orderById ++++++>>>>>  ${apiResponse1.responseData?.orderDetail?.orderId.toString()}');
    return apiResponse1;

  } else if(response.statusCode == 401){
    print("error fount in 401");
    throw Exception('error fount in 401');
  }
  else {
    throw Exception('Failed to api hit');
  }
}

 String   setStatus(int? status){
  switch(status){
    case 1: return "pending";

    case 2:return"accepted";

    case 3:  return "Completed";

    case 4:  return "Cancel by Vendor";

    case 5:return"Cancel by User";

    default: return "--";
  }
}

String   setStatusType(int? status){
  switch(status){
    case 1: return "Request pending";

    case 2:return"Request pending";

    case 3:  return "Completed on";

    case 4:  return "Cancel on";

    case 5:return"Cancel on";

    default: return " ";
  }
}

/*
Flexible(child: Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
decoration: BoxDecoration(
color: Colors.transparent.withOpacity(.1),
),
child: Padding(
padding: const EdgeInsets.symmetric(
vertical: 8.0),
child: Stack(
alignment: Alignment.center,
children: [
SizedBox(
height: 50,
width: 50,
child: CircularProgressIndicator(
color: Color(0xff6C1B03),
backgroundColor:
Color(0xff9a5742),
// valueColor: AlwaysStoppedAnimation<Color>(themeColor),
),
),
Align(
alignment: Alignment.center,
child: Image.asset(
'assets/images/ic_kict_1.png',
height: 45,
width: 45,
))
])),
))*/
