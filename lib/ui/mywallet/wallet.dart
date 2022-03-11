import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mob_vender/ui/mywallet/walletmodal.dart';

class MyWallet extends StatefulWidget {
  final String accessToken;
  final String walletAmount;
  const MyWallet(  {Key? key,required this.accessToken, required this.walletAmount}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<MyWallet> {




  WalletModal walletModal=WalletModal();
  @override
  void initState() {
    setState(() {
      getWalletData();
    });
    super.initState();

  }
//getVendorApi
  getWalletData() async {
    var accessToken = widget.accessToken.toString();
    walletModal = await getWalletApi("$accessToken");
    print("Length #############>>>>>>   ${walletModal.responseData?.transactionList?.length.toString()}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var length = walletModal.responseData?.transactionList?.length;
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
                              },
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: 110,
                          ),
                          Text("MY Wallet",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'an',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.00)),
                          color: Color(0xff601809),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left:10.w,right: 10.w,bottom: 5.h,top: 20.h),
                              padding: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.only(right: 10.w),
                                      child: Image.asset(
                                        "assets/images/ic_wallet.png",
                                        color: Colors.white,
                                      )),
                                  Text(
                                    'Wallet',
                                    style: TextStyle(
                                      fontFamily: 'an',
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 185.w,
                                  ),
                                  Text(
                                    '₹${widget.walletAmount}',
                                    style: TextStyle(
                                      fontFamily: 'an',
                                      color: Color(0xffddc8c3),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 65.h,
                                margin: EdgeInsets.only(
                                    top: 10.h,
                                    left: 15.w,
                                    right: 15.w,
                                    bottom: 15.h),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.00)),
                                  color: Color(0xfffde2e7),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 20.w,
                                            height: 20.w,
                                            margin: EdgeInsets.only(right: 5),
                                            child: Image.asset(
                                              "assets/images/ic_coupon_wallet.png",
                                            )),
                                        Text(
                                          'Coupon Wallet',
                                          style: TextStyle(
                                            fontFamily: 'an',
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 20.w,
                                      height: 3.h,
                                      color: Color(0xff601809),
                                      margin: EdgeInsets.only(
                                          top: 2.h, bottom: 10.h),
                                    ),
                                    Text(
                                      '₹0.0',
                                      style: TextStyle(
                                        fontFamily: 'an',
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Transactions",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'an',
                              fontWeight: FontWeight.w600,
                              fontSize: 20)),
                      length != null? Flexible(
                        child: RefreshIndicator(
                          color: Colors.black,
                          backgroundColor: Colors.white,

                          onRefresh: () async{
                            await Future.delayed(Duration(milliseconds: 3500));
                            setState(() {
                              getWalletData();
                            });
                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                                  children: List.generate(
                                     walletModal.responseData!.transactionList!.length,
                                      (index) => Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        setTransactionType(walletModal.responseData?.transactionList?.elementAt(index).transactionType),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontFamily: 'an',
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'W ',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: 'an',
                                                              color: Color(0xffe1ad4b),
                                                              fontWeight: FontWeight.w600),children:  <TextSpan>[
                                                          TextSpan(text: walletModal.responseData?.transactionList?.elementAt(index).amountType ==1?
                                                          '₹${walletModal.responseData?.transactionList?.elementAt(index).walletAmount}':
                                                          "₹${walletModal.responseData?.transactionList?.elementAt(index).walletAmount}",

                                                              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color:
                                                          walletModal.responseData?.transactionList?.elementAt(index).amountType ==1 ?
                                                          Color(0xff61a875):
                                                          Color(0xf76f061b))),

                                                        ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Order ID: ${walletModal.responseData?.transactionList?.elementAt(index).orderId}",
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.grey,
                                                            fontFamily: 'an',
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'CW ',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: 'an',
                                                              color: Color(0xffe1ad4b),
                                                              fontWeight: FontWeight.w600),children:  <TextSpan>[
                                                            TextSpan(text:walletModal.responseData?.transactionList?.elementAt(index).amountType ==1?
                                                            CreditCouponWallet( walletModal.responseData?.transactionList?.elementAt(index).walletAmount):
                                                            DebitCouponWallet( walletModal.responseData?.transactionList?.elementAt(index).walletAmount),
                                                                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,
                                                                color:walletModal.responseData?.transactionList?.elementAt(index).amountType ==1 ?
                                                                Color(0xff61a875):
                                                                Color(0xf76f061b)
                                                            )),

                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "payment status",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.blueAccent,
                                                            fontFamily: 'an',
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                        Text(setPaymentStatus(walletModal.responseData?.transactionList?.elementAt(index).status),
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'an',
                                                            color: Colors.blueAccent,
                                                            fontWeight: FontWeight.w600),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text("${walletModal.responseData?.transactionList?.elementAt(index).created}", style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: 'an',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 11)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))),

                          ),
                        ),
                      ):Flexible(
                        child: Container(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
Future<WalletModal> getWalletApi(String accessToken) async {
  print("accessToken of  WalletModal ======>>$accessToken");
  final response = await http.get(
    //https://devhrmapi.mobcoder.com/hrm/api/v1/transaction/list
    //https://devhrmapi.mobcoder.com/hrm/api/v1/order/employeeHistory
    Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/transaction/list'),
    headers: {
      'Authorization': "Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken": accessToken,
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    ///Wrong way to return response of api
    /*  return LoginResponse(status: data["status"], res: null, time: data["time"]);*/

    WalletModal apiResponse1 = WalletModal.fromJson(data);
    print('statusCode =======>>  ${apiResponse1.statusCode}');
    print('Length =======>>  ${apiResponse1.responseData?.transactionList?.length.toString()}');
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}
String   setStatus(int? status){
  switch(status){
    case 1: return "PENDING";

    case 2:return"ACCEPTED";

    case 3:  return "COMPLETED";

    case 4:  return "CANCEL_BY_VENDOR";

    case 5:
      return"CANCEL_BY_USER";

    default: return "BYE..";
  }
}
String   setTransactionType(int? status){
  switch(status){
    case 1: return "Coupon added by Mobcoder";

    case 2:return"Wallet recharge";

    case 3:  return "Order placed";

    case 4:  return "Coupon expired";

    case 5:return"Amount withdraw";

    case 6:return"Order refund amount";

    case 7:return"Amount credited by order";

    default: return "BYE..";
  }
}
String   setPaymentStatus(int? status){
  switch(status){
    case 0:  return "Initiated";
    case 1: return "Complete";
    case 2:return"Failed";
    default: return "BYE..";
  }
}


String CreditCouponWallet(int? CouponWalletAmount){
  if(CouponWalletAmount ==0)
    return "₹$CouponWalletAmount";
  else return "+₹$CouponWalletAmount";
}
String CreditWallet(int? WalletAmount){
  if(WalletAmount ==0)
    return "₹$WalletAmount";
  else return "+₹$WalletAmount";
}

String DebitCouponWallet(int? CouponWalletAmount){
  if(CouponWalletAmount ==0)
    return "₹$CouponWalletAmount";
  else return "-₹$CouponWalletAmount";
}
String DebitWallet(int? WalletAmount){
  if(WalletAmount ==0)
    return "₹$WalletAmount";
  else return "-₹$WalletAmount";
}
