import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common_class.dart';
import 'my_order.dart';

class Filter extends StatefulWidget {
  final bool filter;
  final SingingCharacter? character;
  final ValueNotifier<DateTime?> dateSub;
  final ValueNotifier<DateTime?> dateSub1;
  const Filter({Key? key,required this.filter,required this.character,required this.dateSub,required this.dateSub1}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  Widget build(BuildContext context) {
    bool filter=widget.filter;
    SingingCharacter? _character=widget.character;
    ValueNotifier<DateTime?> dateSub=widget.dateSub;
    ValueNotifier<DateTime?> dateSub1=widget.dateSub1;
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
                        Navigator.pop(
                            context),
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
                            autofocus: !filter,
                            onPressed: () {
                              if (filter == true)
                                setState(() {
                                  filter = !filter;
                                });
                            },
                            child: Expanded(
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
                                    )))),
                      ),
                      Container(
                        width: MediaQuery.of(
                            context)
                            .size
                            .width,
                        child: TextButton(
                            autofocus: filter,
                            onPressed: () {
                              if (filter == false)
                                setState(() {
                                  filter = !filter;
                                });
                            },
                            child: Expanded(
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
                filter ? Container(
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
                            value: SingingCharacter
                                .Pending,
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
                          Radio<SingingCharacter>(
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
                ) :
                Container(
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
                        ValueListenableBuilder<
                            DateTime?>(
                            valueListenable:
                            dateSub,
                            builder: (context,
                                dateVal,
                                child) {
                              return InkWell(
                                  onTap:
                                      () async {
                                    DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2017),
                                        lastDate: DateTime(2050),
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
                                    dateSub.value =
                                        date;
                                  },
                                  child: buildDateTimePicker(dateVal != null
                                      ? convertDate(dateVal)
                                      : 'dd/mm/yyyy'));
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
                        ValueListenableBuilder<
                            DateTime?>(
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
                                        lastDate: DateTime(2050),
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
                                      ? convertDate(dateVal1)
                                      : 'dd/mm/yyyy'));
                            }),
                      ]),
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
                    onPressed: () {},
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
        ));
  }
}
/*

SingleChildScrollView(
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
