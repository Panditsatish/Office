import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as https;
import 'package:mob_vender/ui/myorderdetails/order_details.dart';
import 'package:mob_vender/ui/myorderdetails/order_modal.dart';
import '../common_class.dart';
import 'ordermodal.dart';
class MyOrder extends StatefulWidget {
  final String? accessToken;

  const MyOrder({Key? key, required this.accessToken}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

enum SingingCharacter {
  Unselected,
  Pending,
  Accepted,
  Completed,
  Cancelled_By_Vendor,
  Cancelled_By_user
}

class _AboutUsState extends State<MyOrder> {
  SingingCharacter? _character = SingingCharacter.Unselected;

  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> dateSub1 = ValueNotifier(null);
  bool visible = false;
  bool filter = false;
  MyOrderModal OrderList = MyOrderModal();
 late String startDate;
  late String endDate;


  @override
  initState() {
    setState(() {
      apiCall();
    });
    super.initState();
    }

  apiCall() async {
    String accessToken1 = widget.accessToken.toString();
    print('myOrder AccessToke 00000000 $accessToken1');
    OrderList = await OrderListApi('$accessToken1');
    print('OrderList length ###########>>    ${OrderList.responseData?.orderList?.length.toString()}');
  }

  CancelOrderApiCall(String? OrderId) async {
    String accessToken1 = widget.accessToken.toString();
    print('myOrder AccessToke 00000000 $accessToken1');
    String OrderId1 = OrderId!;
    OrderModal _order = await OrderCancelApi(accessToken1,OrderId1);
    if(_order.statusCode ==1)

      apiCall();

    setState(() {});

    print('length ###########    ${OrderList.responseData?.orderList?.length.toString()}');
  }

/* OrderFilterApiCall([num queryParams = 0,String startDate="",String endDate=""]) async {
    String accessToken1 = widget.accessToken.toString();
    print('OrderFilterApiCall AccessToke ???????????? $accessToken1');
    //num status=3;
    OrderList = await OrderListFilterApi(accessToken1 );
    if(OrderList.statusCode ==1)
      print('length ###########    ${OrderList.responseData?.orderList?.length.toString()}');
    setState(() {});
    print('length ###########    ${OrderList.responseData?.orderList?.length.toString()}');
  }*/


  @override
  Widget build(BuildContext context) {
    //final df =  DateFormat('EE,dd MMM yyyy, hh:mma');
    //var time=widget.paymentDetails_modal.time.toString();

    int? length=OrderList.responseData?.orderList?.length;
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

                length == null ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(.3),

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
                              width:45,
                            ))
                      ])
                  ),
                ):Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.black,
                              )),
                          Text("MY Order",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'an',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                          Container(
                            width: 35.w,
                            height: 30.h,
                            child: IconButton(
                                onPressed: () {
                                  
                                  showModalBottomSheet<void>(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0)),
                                    ),
                                    builder: (BuildContext context) {
                                      return
                                       // Filter(dateSub: dateSub, filter: filter, dateSub1: dateSub1, character: _character,);
                                        StatefulBuilder(

                                          builder: (BuildContext context, void Function(void Function()) setState) {

                                            return Container(
                                                margin: EdgeInsets.only(
                                                    top: 10.h, bottom: 30.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 45.w,
                                                      height: 5.h,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                          shape: BoxShape.rectangle,
                                                          color: Colors.black12),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        right: 10.h,
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment.topRight,
                                                        child: IconButton(
                                                            onPressed: () =>
                                                                Navigator.pop(context),
                                                            icon: Image.asset(
                                                                "assets/images/ic_cross_c.png")),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Filter Order Item',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18),
                                                    ),
                                                    Container(
                                                      margin:
                                                      EdgeInsets.only(top: 15.h),
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      height: .2,
                                                      color: Colors.black12,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                              2.1,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                child: TextButton(
                                                                    onPressed: () {
                                                                      if (filter == false)
                                                                        setState(() {
                                                                          filter = !filter;
                                                                          changeAutofocus();
                                                                          print("Data filter>>>>>>>>> $filter");
                                                                        });
                                                                    },
                                                                    autofocus: visible,
                                                                    child: Align(
                                                                        alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                        child:
                                                                        Text(
                                                                          "Date",
                                                                          style:
                                                                          TextStyle(
                                                                            color:
                                                                            Colors.black,
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                            fontSize:
                                                                            18,
                                                                          ),
                                                                        ))),
                                                              ),
                                                              Container(

                                                                child: TextButton(
                                                                    onPressed: () {
                                                                      if (filter == true)
                                                                        setState(() {
                                                                          filter = !filter;
                                                                          changeAutofocus();
                                                                        });
                                                                    },
                                                                    autofocus: !visible,
                                                                    child: Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                      child: Text(
                                                                        "Status",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                            fontSize:
                                                                            18),
                                                                      ),
                                                                    )),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: .2,
                                                          height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                              1 /
                                                              4,
                                                          color: Colors.black12,
                                                        ),
                                                        filter ?  Container(
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width /
                                                              2.1,
                                                          margin:
                                                          EdgeInsets.only(
                                                              left: 10.w),
                                                          child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 20.h,
                                                                ),
                                                                Text(
                                                                  "start Date",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontSize:
                                                                      15),
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                ValueListenableBuilder<DateTime?>(
                                                                    valueListenable:
                                                                    dateSub,
                                                                    builder: (context, dateVal,
                                                                        child) {
                                                                      return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            DateTime? date = await showDatePicker(
                                                                                context: context,
                                                                                initialDate: DateTime.now(),
                                                                                firstDate: DateTime(2017),
                                                                                lastDate: DateTime.now(),
                                                                                currentDate: DateTime.now(),
                                                                                initialEntryMode: DatePickerEntryMode.calendar,
                                                                                initialDatePickerMode: DatePickerMode.day,
                                                                                builder: (context, child) {
                                                                                  return Padding(
                                                                                    padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 1.0),
                                                                                    child: Center(
                                                                                      child: Theme(
                                                                                        data: Theme.of(context).copyWith(
                                                                                            colorScheme: const ColorScheme.light(
                                                                                              primary: Colors.black,
                                                                                            )),
                                                                                        child: child!,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                });
                                                                            dateSub.value = date;
                                                                          },
                                                                          child: buildDateTimePicker(dateVal != null
                                                                              ? startDate = convertDate(dateVal) : 'yyyy-MM-DD'));
                                                                    }),
                                                                SizedBox(
                                                                  height: 20.h,
                                                                ),
                                                                Text(
                                                                  "end Date",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontSize:
                                                                      15),
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                ValueListenableBuilder<DateTime?>(
                                                                    valueListenable:
                                                                    dateSub1,
                                                                    builder: (context,
                                                                        dateVal1,
                                                                        child) {
                                                                      return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            DateTime? date = await showDatePicker(
                                                                                context: context,
                                                                                initialDate: DateTime.now(),
                                                                                firstDate: DateTime(2017),
                                                                                lastDate: DateTime.now(),
                                                                                currentDate: DateTime.now(),
                                                                                initialEntryMode: DatePickerEntryMode.calendar,
                                                                                initialDatePickerMode: DatePickerMode.day,
                                                                                builder: (context, child) {
                                                                                  return Padding(
                                                                                    padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 1.0),
                                                                                    child: Center(
                                                                                      child: Theme(
                                                                                        data: Theme.of(context).copyWith(
                                                                                            colorScheme: const ColorScheme.light(
                                                                                              primary: Colors.black,
                                                                                            )),
                                                                                        child: child!,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                });
                                                                            dateSub1.value =
                                                                                date;
                                                                          },
                                                                          child: buildDateTimePicker(dateVal1 != null
                                                                              ? endDate = convertDate(dateVal1)
                                                                              : 'YYYY-MM-DD'));
                                                                    }),
                                                              ]),
                                                        ):Container(
                                                          width: MediaQuery.of(context).size.width / 2.1,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Radio<SingingCharacter>(
                                                                    value: SingingCharacter.Pending,
                                                                    activeColor: Colors.black,
                                                                    groupValue: _character,
                                                                    onChanged: (SingingCharacter?value) {
                                                                      setState(() {
                                                                            _character = value;
                                                                          });
                                                                    },
                                                                  ),
                                                                  Flexible(
                                                                    fit: FlexFit.loose,
                                                                      child: Text(
                                                                          'Pending',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 15))),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio<
                                                                      SingingCharacter>(
                                                                    value: SingingCharacter
                                                                        .Accepted,
                                                                    activeColor:
                                                                    Colors
                                                                        .black,
                                                                    groupValue:
                                                                    _character,
                                                                    onChanged:
                                                                        (SingingCharacter?
                                                                    value) {
                                                                      setState(
                                                                              () {
                                                                            _character =
                                                                                value;
                                                                          });
                                                                    },
                                                                  ),
                                                                  Flexible(
                                                                      fit: FlexFit.loose,
                                                                      child: Text(
                                                                          'Accepted',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 15))),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio<
                                                                      SingingCharacter>(
                                                                    value: SingingCharacter
                                                                        .Completed,
                                                                    activeColor:
                                                                    Colors
                                                                        .black,
                                                                    groupValue:
                                                                    _character,
                                                                    onChanged:
                                                                        (SingingCharacter?
                                                                    value) {
                                                                      setState(
                                                                              () {
                                                                            _character =
                                                                                value;
                                                                          });
                                                                    },
                                                                  ),
                                                                  Text(
                                                                      'Completed',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                          15)),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio<
                                                                      SingingCharacter>(
                                                                    value: SingingCharacter
                                                                        .Cancelled_By_Vendor,
                                                                    activeColor:
                                                                    Colors
                                                                        .black,
                                                                    groupValue:
                                                                    _character,
                                                                    onChanged:
                                                                        (SingingCharacter?
                                                                    value) {
                                                                      setState(
                                                                              () {
                                                                            _character =
                                                                                value;
                                                                          });
                                                                    },
                                                                  ),
                                                                  Flexible(
                                                                      fit: FlexFit.loose,
                                                                      child: Text(
                                                                          'Cancelled By Vendor',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 15))),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio<
                                                                      SingingCharacter>(
                                                                    value: SingingCharacter
                                                                        .Cancelled_By_user,
                                                                    activeColor:
                                                                    Colors
                                                                        .black,
                                                                    groupValue:
                                                                    _character,
                                                                    onChanged:
                                                                        (SingingCharacter?
                                                                    value) {
                                                                      setState(
                                                                              () {
                                                                            _character =
                                                                                value;
                                                                          });
                                                                    },
                                                                  ),
                                                                  Flexible(
                                                                      fit: FlexFit.loose,
                                                                      child: Text(
                                                                          'Cancelled By user',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 15))),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                              2,
                                                          height: 40,
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            child: Text(
                                                              'Clear All',
                                                              style: TextStyle(
                                                                  fontFamily: 'an',
                                                                  fontSize: 18,
                                                                  color: Colors.black,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 150.w,
                                                          height: 40,
                                                          margin: EdgeInsets.only(
                                                              left: 10, right: 10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(35.0),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .black26,
                                                                    blurRadius: 10.0,
                                                                    offset: Offset(
                                                                        0.0,
                                                                        5.0)), //BoxShadow
                                                              ],
                                                              color:
                                                              Color(0xff6c1c01)),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                             // OrderFilterApiCall( getStatus(_character));
                                                            },
                                                            child: Text(
                                                              'Apply',
                                                              style: TextStyle(
                                                                  fontFamily: 'an',
                                                                  fontSize: 15,
                                                                  color: Colors.white,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                            );
                                          }
                                        );
                                    },
                                  );
                                },
                                icon: Image.asset("assets/images/ic_filter.png")),
                          )
                        ],
                      ),
                      Flexible(
                        child: RefreshIndicator(
                          color: Colors.black,
                          onRefresh: ()async{
                            await Future.delayed(Duration(milliseconds: 3500));
                            setState(() {
                              apiCall();
                            });
                          },

                          child:ListView.separated(
                            itemBuilder: (context, index) {
                              return  Card(
                                shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderDetails(
                                                          accessToken:
                                                              '${widget.accessToken}',
                                                          orderId: OrderList
                                                              .responseData!
                                                              .orderList!
                                                              .elementAt(index)
                                                              .orderId!)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${OrderList.responseData?.orderList?.elementAt(index).employeeName?.firstName} "
                                                        "${OrderList.responseData?.orderList?.elementAt(index).employeeName?.lastName}",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: 'an',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Visibility(
                                                        visible: OrderList
                                                                    .responseData
                                                                    ?.orderList
                                                                    ?.elementAt(
                                                                        index)
                                                                    .status ==
                                                                1
                                                            ? true
                                                            : false,
                                                        child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10.w),
                                                            width: 30,
                                                            height: 30,
                                                            child: Image.asset(
                                                              'assets/images/ic_scan.jpg',
                                                              fit: BoxFit.fill,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    "${OrderList.responseData?.orderList?.elementAt(index).vendorDetail?.phoneNo}",
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 15,
                                                      fontFamily: 'an',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Scheduled for",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'an',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    dateConverter(
                                                        DateTime.parse(OrderList
                                                            .responseData!
                                                            .orderList!
                                                            .elementAt(index)
                                                            .created!)),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'an',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${OrderList.responseData?.orderList?.length} Item",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'an',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    "₹ ${OrderList.responseData?.orderList?.elementAt(index).totalPrice}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'an',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${setText(OrderList.responseData?.orderList?.elementAt(index).status)}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'an',
                                                      color: setColor(OrderList
                                                          .responseData
                                                          ?.orderList
                                                          ?.elementAt(index)
                                                          .status),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Wrap(
                                                children: List.generate(
                                                  OrderList.responseData!
                                                      .orderList!.length,
                                                  (index1) => Card(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 80.w,
                                                            height: 70.h,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              child:
                                                                  Image.network(
                                                                "${OrderList.responseData?.orderList?.elementAt(index).foods?.elementAt(index).images?[0] ?? "https://media.istockphoto.com/photos/mug-on-plate-filled-with-coffee-surrounded-by-coffee-beans-picture-id157528129"}",
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 12.w),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${OrderList.responseData?.orderList?.elementAt(index).foods?.elementAt(index).name}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontFamily:
                                                                          'an',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                Text(
                                                                    '₹${OrderList.responseData?.orderList?.elementAt(index).foods?.elementAt(index).price}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .black,
                                                                    )),
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    text:
                                                                        '${OrderList.responseData?.orderList?.elementAt(index).foods?.elementAt(index).quantity} Item |',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontFamily:
                                                                            'an',
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    children: <
                                                                        TextSpan>[
                                                                      TextSpan(
                                                                        text:
                                                                            ' ₹${OrderList.responseData?.orderList?.elementAt(index).foods?.elementAt(index).total}',
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Visibility(
                                                visible: OrderList.responseData
                                                            ?.orderList
                                                            ?.elementAt(index)
                                                            .status ==
                                                        1
                                                    ? true
                                                    : false,
                                                child: TextButton(
                                                  onPressed: () {
                                                    CancelOrderApiCall(OrderList
                                                        .responseData?.orderList
                                                        ?.elementAt(index)
                                                        .orderId);
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            60.w,
                                                    margin: EdgeInsets.only(),
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                      color: Color(0xff6c1c01),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Cancel Order",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'an',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );

                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: length,
                          ),
                          /*SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                                children: List.generate(
                                    length,
                                    (index) => Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                                    OrderDetails( accessToken: '${widget.accessToken}',
                                                        orderId: OrderList.responseData!.orderList!.elementAt(index).orderId!)));
                                              },
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "${OrderList.responseData?.orderList?.elementAt(index).employeeName?.firstName} "
                                                                 "${OrderList.responseData?.orderList?.elementAt(index).employeeName?.lastName}",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily: 'an',
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                          ),
                                                          Visibility(
                                                            visible: OrderList.responseData?.orderList?.elementAt(index).status == 1 ? true :false,
                                                            child: Container(
                                                              margin: EdgeInsets.only(left: 10.w),
                                                              width: 30,
                                                                height: 30,
                                                                child: Image.asset('assets/images/ic_scan.jpg',fit: BoxFit.fill,)),
                                                          )
                                                        ],
                                                      ),
                                                      Text(
                                                        "${OrderList.responseData?.orderList?.elementAt(index).vendorDetail?.phoneNo}",
                                                        style: TextStyle(
                                                          decoration: TextDecoration.underline,
                                                            fontSize: 15,
                                                            fontFamily: 'an',
                                                            fontWeight:
                                                            FontWeight
                                                                .w400,),

                                                      ),

                                                    ],
                                                  ),
                                                  SizedBox(height: 5.h,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Scheduled for",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: 'an',
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        dateConverter(DateTime.parse(OrderList.responseData!.orderList!.elementAt(index).created!)
                                                        ),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: 'an',
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${OrderList.responseData?.orderList?.length} Item",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily: 'an',
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        "₹ ${OrderList.responseData?.orderList?.elementAt(index).totalPrice}",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: 'an',
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "${setText(OrderList.responseData?.orderList?.elementAt(index).status)}",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: 'an',
                                                          color: setColor(OrderList.responseData?.orderList?.elementAt(index).status),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Wrap(
                                                    children:
                                                      List.generate(
                                                        OrderList.responseData!.orderList!.length, (index1) => Card(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 80.w,
                                                                  height: 70.h,
                                                                  child: ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        10.0),
                                                                    child: Image.network("${OrderList.responseData?.orderList?.elementAt(index).foods?.images?[0]
                                                                    ?? "https://media.istockphoto.com/photos/mug-on-plate-filled-with-coffee-surrounded-by-coffee-beans-picture-id157528129"}",
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: 12.w),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        "${OrderList.responseData?.orderList?.elementAt(index).foods?.name}",
                                                                        style: TextStyle(
                                                                            fontSize: 18,
                                                                            fontFamily: 'an',
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w400),
                                                                      ),
                                                                      Text('₹${OrderList.responseData?.orderList?.elementAt(index).foods?.price}',
                                                                          style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                            fontSize: 15,
                                                                            color:
                                                                            Colors.black,
                                                                          )),
                                                                      RichText(
                                                                        text: TextSpan(
                                                                          text: '${OrderList.responseData?.orderList?.elementAt(index).foods?.quantity} Item |',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily:
                                                                              'an',
                                                                              color: Colors
                                                                                  .black,
                                                                              fontWeight:
                                                                              FontWeight
                                                                                  .w500),
                                                                          children:  <
                                                                              TextSpan>[
                                                                            TextSpan(
                                                                              text: ' ₹${OrderList.responseData?.orderList?.elementAt(index).foods?.total}',
                                                                              style:
                                                                              TextStyle(
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .w500,
                                                                                fontSize: 12,
                                                                                color: Colors
                                                                                    .black,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                  ),

                                                  SizedBox(
                                                    height: 8.h,
                                                  ),


                                                  Visibility(
                                                    visible: OrderList.responseData?.orderList?.elementAt(index).status == 1 ? true :false,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        CancelOrderApiCall(OrderList.responseData?.orderList?.elementAt(index).orderId);
                                                      },
                                                      child: Container(
                                                        width:MediaQuery.of(context).size.width-60.w,
                                                        margin: EdgeInsets.only(),
                                                        height: 30.h,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  25.0),
                                                          color: Color(0xff6c1c01),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Cancel Order",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: 'an',
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))),
                          )*/
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

  String   setText(int? status){
    switch(status){
      case 1: return "pending";

      case 2:return"accepted";

      case 3:  return "Completed";

      case 4:  return "Cancel by Vendor";

      case 5:return"Cancel by User";
      default: return " ";
    }
  }

  dynamic  getStatus(SingingCharacter? status){
    switch(status){
      case SingingCharacter.Pending: return 1 ;

      case SingingCharacter.Accepted: return 2 ;

      case SingingCharacter.Completed:  return 3;

      case SingingCharacter.Cancelled_By_Vendor:  return 4;

      case SingingCharacter.Cancelled_By_user:return 5;

      default: return 0;
    }
  }

  void changeAutofocus() {
    visible = !visible;
  }

}

Widget buildDateTimePicker(String data) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 1.0, color: Colors.black)),
    ),
    child: Text(data),
  );
}



Future<MyOrderModal> OrderListApi(String accessToken) async {
  print("access Testing is eerrrooo $accessToken");
  final response = await https.get(
    Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/order/list'),
    headers: {
      'Authorization': "Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken": accessToken,
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    MyOrderModal apiResponse1 = MyOrderModal.fromJson(data);
    print('###########  ++++++>>>>>  ${apiResponse1.statusCode}');
    print('###########  ++++++>>>>>  ${apiResponse1.responseData?.orderList?.length.toString()}');
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}

   setColor(int? colors){
  switch(colors){
    case 1:  return Colors.black.withOpacity(.3);

    case 2:  return Colors.yellow;

    case 3:  return Colors.green.withOpacity(.7);

    case 4:  return Colors.red.withOpacity(.9);

    case 5:  return Colors.red.withOpacity(.9);

    default: return "CAT";
  }
}
/*

Future<MyOrderModal> OrderListFilterApi(String accessToken, [num queryParams = 0,String startDate="",String endDate=""]) async {
  print("access Testing is https $accessToken");
  var uri=Uri.https('devhrmapi.mobcoder.com','/hrm/api/v1/order/list',
    queryParams == null ? null : {"status":queryParams}.map((key, value) => MapEntry(key, value.toString())),
  );
  final response = await https.get(uri,
    headers:{
      'Authorization':"Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken":accessToken,
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('data ###########  ++++++>>>>>  ${data}');

    MyOrderModal apiResponse1 = MyOrderModal.fromJson(data);
    print('###########  ++++++>>>>>  ${apiResponse1.statusCode}');
    print(
        '###########  ++++++>>>>>  ${apiResponse1.responseData?.orderList?.first.foods?.length.toString()}');
    return apiResponse1;
  } else {
    throw Exception('Failed to load employee');
  }
}
*/

Future<OrderModal> OrderCancelApi(String accessToken,String orderId) async{
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