import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mob_vender/ui/login/uers_login.dart';

import 'forgotbloc.dart';
import 'forgotevent.dart';
import 'forgotstate.dart';


class Forgot extends StatelessWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360,690),
        builder: ()=>  MaterialApp(
          debugShowCheckedModeBanner: false,

          home: MyHome(),
        )

    );
  }
}
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController emailController= TextEditingController();
  late  bool isLoader=false;
  void _loaderState() {
    setState(() {
      isLoader = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    final ForgotBloc forgotBloc = BlocProvider.of<ForgotBloc>(context);
    // final ProgressDialog progressDialog = ProgressDialog(context: context);
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: BlocConsumer<ForgotBloc,ForgotState>(listener: (context,state){
            if(state.isSuccess){
              isLoader = false;

              if(state.response1?.statusCode==1){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:
                    (context)=>LoginPage()));
               // Navigator.pop(context);
              }else
              {
                showToast('${state.response1?.error?.errorMessage.toString()}',
                  textStyle: TextStyle(color: Colors.black),
                  context: context,
                  backgroundColor: Colors.white,
                  animation: StyledToastAnimation.scale,
                  reverseAnimation: StyledToastAnimation.fade,
                  position: StyledToastPosition.bottom,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  animDuration: Duration(seconds: 1),
                  duration: Duration(seconds: 3),
                  curve: Curves.elasticOut,
                  reverseCurve: Curves.linear,
                );
                /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:  Align(
                    alignment: Alignment.bottomCenter,
                      child: Text('${state.response1?.error?.errorMessage.toString()}')),
                ));*/
              }
              //Navigator.pop(context);

              Navigator.pushReplacement(context, MaterialPageRoute(builder:
                  (context)=>LoginPage()));
            }

          },builder: (context,state){
            return Center(
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset('assets/images/ic_splash.png',fit: BoxFit.fill,)
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        margin: EdgeInsets.only(left: 35 ,right: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width:300,
                              height: 80,
                              child: Image.asset('assets/images/ic_kict_1.png'),
                              margin: EdgeInsets.only(bottom: 60.h),
                            ),
                            Row(
                              children: [
                                Icon(Icons.email_outlined,size: 25,),
                                Container(
                                    margin: EdgeInsets.only(left: 10,top:5),
                                    child: Align(
                                      alignment: Alignment.center,
                                        child: Text('Email',style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'an',),)))
                              ],
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10),
                              child: TextField(
                                inputFormatters: [ LengthLimitingTextInputFormatter(35),],
                                controller: emailController,
                                onChanged: (String email)=> forgotBloc.add(EmailEvent(email)),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 35.0),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )
                                  ),
                                  hintText: 'Type Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 45,
                              margin: EdgeInsets.only(top: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.black),
                              child:TextButton(
                                onPressed: (state.isEmailValid)
                                    ?(){
                                  _loaderState();
                                  forgotBloc.add(OnLoginSuccessEvent(emailController.text));
                                }:null,
                                child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),),
                            ),
                            Container(
                              width: double.infinity,
                              height: 45,
                              margin: EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: const Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                  color: Colors.white),
                              child:TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:
                                      (context)=>LoginPage()));

                                },
                                child: Text('CANCEL',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.normal),),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  isLoader  ? Container(
                    decoration: BoxDecoration(
                        color: Color(0xffacacac),
                        borderRadius: BorderRadius.circular(10.0)
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
                        ])
                    ),
                  ):Container(),
                ],
              ),
            );
          }
          ),
        ),
      ),
    );
  }
}
