import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mob_vender/ui/about_us/about.dart';
import 'package:mob_vender/ui/dashbord/vendormodal.dart';
import 'package:mob_vender/ui/login/loginbloc.dart';
import 'package:mob_vender/ui/login/uers_login.dart';
import 'package:mob_vender/ui/mobmenu/mob_menu.dart';
import 'package:mob_vender/ui/myorder/my_order.dart';
import 'package:mob_vender/ui/mywallet/wallet.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dash_modal.dart';

class DashBord extends StatelessWidget {
  final String? accessToken;

  const DashBord({Key? key, required this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("===============>>>>>>>>>>>>>>>>   $accessToken");

    return ScreenUtilInit(
      //MediaQuery.of(context).size.width,MediaQuery.of(context).size.height
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyDashBord(
          accessToken: "$accessToken",
        ),
      ),
    );
  }
}

class MyDashBord extends StatefulWidget {
  final String? accessToken;

  const MyDashBord({Key? key, required this.accessToken}) : super(key: key);

  @override
  _MyDashBordState createState() => _MyDashBordState();
}

class _MyDashBordState extends State<MyDashBord> {
  bool visible = true;
  final globalKey = GlobalKey<ScaffoldState>();
  HomeModal home = HomeModal();
  VendorModal vendorModal = VendorModal();

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
      getVendorData();
    });
  }

//getVendorApi
  getVendorData() async {
    var accessToken = widget.accessToken.toString();
    vendorModal = await getVendorApi("$accessToken");
    print(
        "Length #############>>>>>>   ${vendorModal.responseData?.vendorList?.length.toString()}");

    setState(() {});
  }

  getData() async {
    var accessToken = widget.accessToken.toString();
    home = await gotoDashApi("$accessToken");
    print("₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹   ${home.responseData?.employeeProfile?.phone}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var accessToken = widget.accessToken.toString();
    var length = vendorModal.responseData?.vendorList?.length.toString();
    print(" Testing access  ------------ $accessToken");
    EdgeInsets padding = MediaQuery.of(context).viewPadding;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child:length !=null ? Scaffold(
        key: globalKey,
        drawer: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: padding,
            width: MediaQuery.of(context).size.width - 50.w,
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    31.w,
                  ),
                  bottomRight: Radius.circular(
                    30.w,
                  )),
              child: Drawer(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/images/ic_nav_head.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    "assets/images/ic_cross_c.png",
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${home.responseData?.employeeProfile?.firstName} ${home.responseData?.employeeProfile?.lastName}",
                            style: TextStyle(
                              fontFamily: 'an',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '${home.responseData?.employeeProfile?.email}',
                            style: TextStyle(
                              fontFamily: 'an',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${home.responseData?.employeeProfile?.phone}',
                            style: TextStyle(
                              fontFamily: 'an',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Color(0xff7b3a26),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.00)),
                              color: Color(0xff884935),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 20,
                                              height: 20,
                                              margin:
                                                  EdgeInsets.only(right: 15.w),
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
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '₹${home.responseData?.employeeProfile?.walletBalance}',
                                        style: TextStyle(
                                          fontFamily: 'an',
                                          color: Colors.white,
                                          fontSize: 15,
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
                                        left: 10.w,
                                        right: 10.w,
                                        bottom: 10.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.00)),
                                      color: Color(0xffa16d5d),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 20.w,
                                                height: 20.w,
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Image.asset(
                                                  "assets/images/ic_coupon_wallet.png",
                                                  color: Colors.white,
                                                )),
                                            Text(
                                              'Coupon Wallet',
                                              style: TextStyle(
                                                fontFamily: 'an',
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 25.w,
                                          height: 1.5.h,
                                          color: Colors.white,
                                          margin: EdgeInsets.only(
                                              top: 5.h, bottom: 5.h),
                                        ),
                                        Text(
                                          '₹0.0',
                                          style: TextStyle(
                                            fontFamily: 'an',
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
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
                            height: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyOrder(
                                            accessToken: '$accessToken',
                                          )));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    ),
                                  ),
                                  Text(
                                    'My Orders',
                                    style: TextStyle(
                                      fontFamily: 'an',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1.h,
                            margin: EdgeInsets.only(left: 40.w),
                            color: Color(0xff7c3c2a),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyWallet(
                                            accessToken: '$accessToken',
                                            walletAmount:
                                                '${home.responseData?.employeeProfile?.walletBalance}',
                                          )));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        'assets/images/ic_wallet.png',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'My Wallet',
                                    style: TextStyle(
                                      fontFamily: 'an',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1.h,
                            margin: EdgeInsets.only(left: 40.w),
                            color: Color(0xff7c3c2a),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AboutUs()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        'assets/images/ic_about_us.png',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'About Us',
                                    style: TextStyle(
                                      fontFamily: 'an',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1.h,
                            margin: EdgeInsets.only(left: 40.w),
                            color: Color(0xff7c3c2a),
                          ),
                          SizedBox(
                            height: 75,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Navigator.pop(context);
                              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                              sharedPreferences.remove("accessToken");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<LoginBloc>(
                                              create: (context) => LoginBloc(),
                                              child: LoginPage())));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.00),
                                  color: Colors.white),
                              width: MediaQuery.of(context).size.width,
                              height: 32.h,
                              margin: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 25,
                                      height: 25,
                                      padding: EdgeInsets.all(4.00),
                                      child: Image.asset(
                                        'assets/images/ic_logout.png',
                                        color: Colors.black,
                                      )),
                                  Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontFamily: 'an',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: padding,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/ic_splash.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 25.w,
                          alignment: Alignment.topLeft,
                          height: 25.h,
                          child: GestureDetector(
                              onTap: () {
                                globalKey.currentState!.openDrawer();
                              },
                              child: Image.asset(
                                "assets/images/ic_menu.png",
                                fit: BoxFit.fill,
                              ))),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Hello ${home.responseData?.employeeProfile?.firstName},',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                      Text(
                        'WELCOME BACK!',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: 5,
                        ),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: Image.asset("assets/images/ic_order_bg.png",
                                fit: BoxFit.fill)),
                      ),
                      Visibility(
                        visible: visible,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Color(0xfffad2c2),
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/ic_like.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 8, bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Help Us improve!',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16.w),
                                      ),
                                      Text(
                                        'Please Share your feedback',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12.w),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Rate Us',
                                  style: TextStyle(
                                      color: Color(0xff8d4a35),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ),
                              Container(
                                  width: 40.w,
                                  height: 40.h,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                      icon: Image.asset(
                                        'assets/images/ic_cross_c.png',
                                      ))),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.h,
                              child: Image.asset(
                                "assets/images/ic_vendor.png",
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Select Vendor',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.1,
                        child:
                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        triggerMode: RefreshIndicatorTriggerMode.onEdge,

                        onRefresh: () async{
                          await Future.delayed(Duration(milliseconds: 1500));
                          setState(() {
                            getVendorData();
                          });

                        },
                        child: GridView.count(
                                  childAspectRatio: 1 / 1.3,
                                  crossAxisCount: 2,
                                  children: List.generate(
                                      vendorModal.responseData!.vendorList!.length
                                          .toInt(), (int index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => MobMenu(
                                                        accessToken:
                                                            '${widget.accessToken}',
                                                        vendorId:
                                                            '${vendorModal.responseData?.vendorList?.elementAt(index).vendorId}',
                                                        name:
                                                            '${vendorModal.responseData?.vendorList?.elementAt(index).name}',
                                                        number: int.parse(
                                                            '${vendorModal.responseData?.vendorList?.elementAt(index).phoneNo}'),
                                                      )));
                                        },
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    width: 0.7,
                                                    color: Colors.grey)),
                                            elevation: 5.0,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 10),
                                                    height: 55.h,
                                                    width: 60.w,
                                                    child: ClipOval(
                                                      child: Image.network('${vendorModal.responseData?.vendorList?.elementAt(index).image ??=
                                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmxg-n1bUayrS_dZMzKCTuj9JlqUy9CNMcYg&usqp=CAU'}',
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 10),
                                                    child: Text(
                                                      "Order from\nMOB's Kitchen",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 10),
                                                    child: Text(
                                                      " ${vendorModal.responseData?.vendorList?.elementAt(index).name}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 18,
                                                        left: 30,
                                                        right: 30,
                                                        bottom: 10),
                                                    width: 150.w,
                                                    height: 25.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                25.0),
                                                        color: Color(0xff6c1c01)),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                5.0),
                                                        child: Text(
                                                          'Order now',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.normal,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ])));
                                  })),
                      )
                          /*  :Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 2,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Stack(
                                        alignment: Alignment.topCenter,
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
                                              alignment: Alignment.topCenter,
                                              child: Image.asset(
                                                'assets/images/ic_kict_1.png',
                                                height: 45,
                                                width: 45,
                                              ))
                                        ])),
                              ),*/
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ):
      Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.3),
            ),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0),
                  child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                            'assets/images/ic_splash.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: Color(0xff6C1B03),
                              backgroundColor:
                              Color(0xff9a5742),
                              // valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/ic_kict_1.png',
                              height:45,
                              width: 45,
                            ))
                      ])),
            ),
          ),
        ),
      ),
    );
  }
}

Future<HomeModal> gotoDashApi(String accessToken) async {
  final response = await http.get(
    Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/getProfile'),
    headers: {
      'Authorization': "Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken": accessToken,
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    ///Wrong way to return response of api
    /*  return LoginResponse(status: data["status"], res: null, time: data["time"]);*/

    HomeModal apiResponse1 = HomeModal.fromJson(data);
    print('###########    ${apiResponse1.responseData?.employeeProfile?.email}');

    print('get profile======>>>>>    ${data.toString()}');
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}

Future<VendorModal> getVendorApi(String accessToken) async {
  final response = await http.get(
    Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/vendors'),
    headers: {
      'Authorization': "Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken": accessToken,
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    ///Wrong way to return response of api
    /*  return LoginResponse(status: data["status"], res: null, time: data["time"]);*/

    VendorModal apiResponse1 = VendorModal.fromJson(data);
    print(
        'Length =======>>  ${apiResponse1.responseData?.vendorList?.length.toString()}');
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}
