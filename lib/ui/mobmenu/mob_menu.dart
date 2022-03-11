import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mob_vender/ui/mobmenu/menumodal.dart';
import 'package:http/http.dart' as https;
import 'package:mob_vender/ui/payment/payment_details.dart';
import 'package:url_launcher/url_launcher.dart';

class MobMenu extends StatefulWidget {
  final String accessToken;
  final String vendorId;
  final String name;
  final int number;

  const MobMenu(
      {Key? key,
      required this.accessToken,
      required this.vendorId,
      required this.name,
      required this.number})
      : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<MobMenu> {
  MenuModal menuModal = MenuModal();




  @override
  initState() {
    super.initState();
    apiCall();


  }


  apiCall() async {
    String accessToken = widget.accessToken.toString();
    print("!!!!!!!!!!!!!!! =======>>>>>>> $accessToken");
    String vendorId = widget.vendorId.toString();
    print("vendorId  !!!!!!!!!!!!!!! =======>>>>>>> $vendorId");

    menuModal = await FoodListApi('$accessToken', '$vendorId');
    setState(() {});

  }

  bool visible = false;
  int view= 0;
  int? totalPrice=0;
  int total =0;
  List<FoodItemList> checkoutList = [];
 // List<int?> list =   List<int?>.filled(0, null, growable: true) ;



 // var list = List.generate(2, (index) => index);


  @override
  Widget build(BuildContext context) {
    /*
    dynamic listMod = menuModal.responseData?.foodItemList;
    List<listMod> list =   List<listMod>.filled(0, null, growable: true) ;*/
    int Number = widget.number.toInt();
    print("phoneNo  !!!!!!!!!!!!!!! =======>>>>>>> $Number");

    var length = menuModal.responseData?.foodItemList?.length;
    print('length==========>    $length');
    /*if(length != null)
    for(int i=0 ;i <= length-1;i++) {
      if (menuModal.responseData?.foodItemList?.removeAt(i).visible ==
          true) {
        setState(() {
          visible = true;
        });

      }else{
        setState(() {
          visible = false;
        });
      }
    }*/

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
                            width: 80.w,
                          ),
                          Text("MOB's Menu",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'an',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Color(0xfffad2c2),
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/ic_vendor.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${widget.name}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                launch('tel:${widget.number}');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Color(0xffc59e96),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 3.0, 8.0, 3.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.call,
                                            color: Color(0xff6c1a03),
                                            size: 15,
                                          ),
                                          Text(
                                            "Call",
                                            style: TextStyle(
                                                color: Color(0xff6c1a03)),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                      length != null
                          ? Flexible(
                              child: RefreshIndicator(
                                backgroundColor: Colors.white,

                                strokeWidth: 3,
                                color: Colors.black,
                                onRefresh: () async {
                                  await Future.delayed(
                                      Duration(microseconds: 2000));
                                  setState(() {
                                    apiCall();
                                  });
                                },
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Wrap(
                                      children: List.generate(
                                          menuModal
                                              .responseData!.foodItemList!.length,
                                          (int index) => Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 90.w,
                                                            height: 75.h,
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                child:
                                                                    Image.network(
                                                                  '${menuModal.responseData?.foodItemList?.elementAt(index).images?[0] ?? "https://media.istockphoto.com/photos/mug-on-plate-filled-with-coffee-surrounded-by-coffee-beans-picture-id157528129"}',
                                                                  fit:
                                                                      BoxFit.fill,
                                                                )
                                                                //${String.parse('${menuModal.responseData?.foodItemList?.elementAt(index).images.toString()}')}
                                                                ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 14.w,
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5.0,
                                                                          top: 10
                                                                              .h),
                                                                  child: Text(
                                                                    "${menuModal.responseData?.foodItemList?.elementAt(index).name}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15.w,
                                                                        fontFamily:
                                                                            'an',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5.0),
                                                                  child: Text(
                                                                      '₹${menuModal.responseData?.foodItemList?.elementAt(index).price}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top: 3
                                                                              .h),
                                                                  child: Card(
                                                                    elevation:
                                                                        2.0,
                                                                    color: Colors
                                                                        .white60,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                25.0)),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              38.w,
                                                                          height:
                                                                              33.h,
                                                                          child:
                                                                              TextButton(
                                                                            child: Container(
                                                                                height: 25,
                                                                                alignment: Alignment.topCenter,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                  color: Color(0xff8f5e47),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(
                                                                                    bottom: 10.0,
                                                                                  ),
                                                                                  child: Text(
                                                                                    '-',
                                                                                    style: TextStyle(fontSize: 15.h, color: Colors.white, fontWeight: FontWeight.w700),
                                                                                  ),
                                                                                )),
                                                                            onPressed:
                                                                                () {
                                                                                  int? Quantity =menuModal.responseData?.foodItemList?.elementAt(index).quantity;
                                                                                  if(Quantity! > 0){
                                                                                    Quantity = Quantity - 1 ;

                                                                                  }
                                                                                  setState((){
                                                                                    menuModal.responseData?.foodItemList?.elementAt(index).quantity = Quantity!;
                                                                                if(view >0 && Quantity! >=0 && menuModal.responseData!.foodItemList!.elementAt(index).visible ){
                                                                                  --view;
                                                                                  totalPrice= menuModal.responseData!.foodItemList!.elementAt(index).price;
                                                                                  total = (total - totalPrice! );
                                                                                  if(checkoutList.contains(menuModal.responseData?.foodItemList?.elementAt(index))==true)
                                                                                    checkoutList.remove(menuModal.responseData?.foodItemList?.elementAt(index) ?? FoodItemList());

                                                                                  //list.remove(menuModal.responseData!.foodItemList!.elementAt(index).selectedQuantity);
                                                                                }

                                                                                if (Quantity! >0) {

                                                                                  var price = menuModal.responseData?.foodItemList?.elementAt(index).price!;
                                                                                  print('Quantity =====>>> ${ menuModal.responseData?.foodItemList?.elementAt(index).quantity}');
                                                                                  menuModal.responseData?.foodItemList?.elementAt(index).total = (Quantity*price!);

                                                                                }
                                                                                if (Quantity > 0) {
                                                                                  menuModal.responseData?.foodItemList?.elementAt(index).visible = true;
                                                                                } else {
                                                                                  menuModal.responseData?.foodItemList?.elementAt(index).visible = false;
                                                                                }
                                                                                print('view ------- $view');
                                                                                print('totalPrice ------- $total');

                                                                                if (view > 0) {
                                                                                  visible = true;
                                                                                } else {
                                                                                  visible = false;
                                                                                }
                                                                              });

                                                                            },
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          margin: EdgeInsets.only(
                                                                              left:
                                                                                  5.w),
                                                                          width:
                                                                              19.w,
                                                                          child:
                                                                              Text(
                                                                            "${menuModal.responseData?.foodItemList?.elementAt(index).quantity}",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 15.0,
                                                                                fontWeight: FontWeight.w500),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              38.w,
                                                                          height:
                                                                              33.h,
                                                                          child:
                                                                              TextButton(
                                                                            child: Container(
                                                                                alignment: Alignment.topCenter,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                  color: Color(0xff8f5e47),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.only(
                                                                                    top: 0.w,
                                                                                  ),
                                                                                  child: Text(
                                                                                    '+',
                                                                                    style: TextStyle(fontSize: 18.h, color: Colors.white),
                                                                                  ),
                                                                                )),
                                                                            onPressed:
                                                                                () {

                                                                                  int? Quantity = menuModal.responseData?.foodItemList?.elementAt(index).quantity  ;
                                                                                  Quantity = Quantity! + 1 ;

                                                                                  setState(() {
                                                                                    menuModal.responseData?.foodItemList?.elementAt(index).quantity= Quantity!  ;

                                                                                    print('++++++++ >>>>>>>> $Quantity');
                                                                                view++;
                                                                                totalPrice= menuModal.responseData!.foodItemList!.elementAt(index).price;
                                                                                total = (total + totalPrice! );
                                                                                   // list.add(menuModal.responseData!.foodItemList!.elementAt(index).selectedQuantity);

                                                                                    if (Quantity! >= 0) {
                                                                                  var price = menuModal.responseData?.foodItemList?.elementAt(index).price!;
                                                                                    print('$Quantity');
                                                                                    print('Quantity =====>>> ${ menuModal.responseData?.foodItemList?.elementAt(index).quantity}');
                                                                                    menuModal.responseData?.foodItemList?.elementAt(index).total = Quantity*price!;
                                                                                }
                                                                                if (Quantity > 0) {
                                                                                  menuModal.responseData?.foodItemList?.elementAt(index).visible = true;
                                                                                } else {
                                                                                  menuModal.responseData?.foodItemList?.elementAt(index).visible = false;

                                                                                }
                                                                                print('view ------- $view');
                                                                                print('totalPrice ------- $total');

                                                                                if (view > 0) {
                                                                                 visible = true;
                                                                                } else {
                                                                                 visible = false;
                                                                                }
                                                                              });
                                                                                  if(checkoutList.contains(menuModal.responseData?.foodItemList?.elementAt(index))==false &&
                                                                                      menuModal.responseData?.foodItemList?.elementAt(index).quantity != 0)
                                                                                    checkoutList.add(menuModal.responseData?.foodItemList?.elementAt(index) ?? FoodItemList());

                                                                            },
                                                                          ),
                                                                        ),

                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 3.h,
                                                      ),

                                                      Visibility(
                                                          visible: menuModal.responseData!.foodItemList!.elementAt(index).visible,
                                                          child: Text('₹${menuModal.responseData?.foodItemList?.elementAt(index).total}')),
                                                    ],
                                                  ),
                                                ),
                                              ))),
                                ),
                              ),
                            )
                          : Flexible(
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
                      Visibility(
                        visible: visible,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 35.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.black),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentDetailsUi(
                                                  accessToken:
                                                      '${widget.accessToken.toString()}', item: view, totalPrice: total,  foodItemList: checkoutList,
                                                )));
                                  },
                                  child: Text(
                                    'Checkout',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.w),
                                  ),
                                ),
                              ),
                            ),
                          ),
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

Future<MenuModal> FoodListApi(String accessToken, String vendorId) async {
  print("access Testing is AccessToken $accessToken");
  print("access Testing is VendorId $vendorId");
/*  Map<String, String> request = Map<String, String>();
  request.putIfAbsent('vendorId', () => vendorId);
   print("request ############  $request");*/

var query={
  "vendorId": vendorId
};
  //vendorId
  final uri=Uri.https('devhrmapi.mobcoder.com','/hrm/api/v1/food/list',query);
  final response = await https.get(uri,
    headers: {
      'Authorization': "Basic aHJtX2FkbWluOmFkbWluQGhybQ==",
      "accessToken": accessToken,
    },

  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
print("++++++++++++  dataResponse ${data.toString()}");
    ///Wrong way to return response of api
    ///  return LoginResponse(status: data["status"], res: null, time: data["time"]);

    MenuModal apiResponse1 = MenuModal.fromJson(data);
    print('###########  ++++++>>>>>  ${apiResponse1.statusCode}');
    return apiResponse1;
  } else {
    throw Exception('Error api hits through 400');
  }
}
