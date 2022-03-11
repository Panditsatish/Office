import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mob_vender/ui/dashbord/dashbordview.dart';
import 'package:mob_vender/ui/login/loginbloc.dart';
import 'package:mob_vender/ui/login/uers_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colorconstant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      builder: ()
      => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.grey
        ),
        home: Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late  String?  FinalAccess =null;

  Future getValidationData()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var obtainedAccessToken= sharedPreferences.getString('accessToken');
    setState(() {
      FinalAccess= obtainedAccessToken;
    });
    print("splash FinalAccess====> $FinalAccess");
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async{
      Timer(
          Duration(seconds: 2),
              () =>FinalAccess == null?
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
          => BlocProvider<LoginBloc>(create: (context) => LoginBloc(), child: LoginPage()))):
          Navigator.pushReplacement(context, MaterialPageRoute(builder:
              (context)=>DashBord( accessToken: '$FinalAccess',)))
      );

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/ic_splash.png',fit: BoxFit.fill,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 200.w,
                      child:Image.asset('assets/images/ic_kict_1.png') ,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "MOB's Kitchen",
                      style: TextStyle(
                          fontFamily: 'van',
                          color: ColorConstant.color_mob,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.h),
                    ),
                  ),
                  Text(
                    "--  P l a c e  Y o u r  O r d e r  --",
                    style: TextStyle(
                        fontFamily: 'an',
                        fontStyle: FontStyle.normal,
                        color: ColorConstant.color_mob,
                        fontWeight: FontWeight.w100,
                        fontSize: 11.h),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
