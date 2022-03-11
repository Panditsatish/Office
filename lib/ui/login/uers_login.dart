import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mob_vender/ui/dashbord/dashbordview.dart';
import 'package:mob_vender/ui/forget/forgot_view.dart';
import 'package:mob_vender/ui/forget/forgotbloc.dart';
import 'package:mob_vender/ui/login/loginstate.dart';
import 'loginbloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginevent.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      builder: ()=>  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.grey
        ),
        home: MyLoginPage(),
      )

    );
  }
}
class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool _isHidden=true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
//late SharedPreferences sharedPreferences;
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  late  bool isLoader=false;
  late bool isCheck =false;

  void _check() {
    setState(() {
      isCheck = true;
    });
  }
  void _loaderState() {
    setState(() {
      isLoader = true;
    });
  }
saveUser(String accessToken)async{
  final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  sharedPreferences.setString('accessToken',accessToken);
}
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
   // final ProgressDialog progressDialog = ProgressDialog(context: context);
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: BlocConsumer<LoginBloc,LoginState>(listener: (context,state){

            if(state.isSuccess){
              isLoader = false;
              var accessToken= state.response1?.responseData?.employeeProfile?.accessToken.toString();
              if(state.response1?.statusCode==1){
                saveUser("$accessToken");
                Navigator.pushReplacement(context, MaterialPageRoute(builder:
                    (context)=>DashBord( accessToken: '$accessToken',)));
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
                  duration: Duration(seconds: 2),
                  curve: Curves.elasticOut,
                  reverseCurve: Curves.linear,
                );
               /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:  Align(
                    alignment: Alignment.bottomCenter,
                      child: Text('${state.response1?.error?.errorMessage.toString()}')),
                ));*/
              }
           }else if(state.isEmailValid == false &&state.isPasswordValid==false  ){
              print('$isCheck');
              print("agdzgjzgfdfjdghS   ");
            }else{
              isLoader = false;
              print('error error');

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
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      margin: EdgeInsets.only(left: 35 ,right: 35,top: 50.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70.h,
                          ),
                          Container(
                            width:300,
                            height: 70,
                            child: Image.asset('assets/images/ic_kict_1.png'),
                            margin: EdgeInsets.only(bottom: 50.h),
                          ),
                          Row(
                            children: [
                              Icon(Icons.email_outlined,size: 18,),
                              Container(
                                  margin: EdgeInsets.only(left: 14),
                                  child: Text('Email',style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'an',),))
                            ],
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10),
                            child: TextField(
                              inputFormatters: [ LengthLimitingTextInputFormatter(40),],
                              controller: emailController,
                              onChanged: (String email)=> loginBloc.add(EmailEvent(email)),
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
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 35),
                            child: Row(
                              children: [
                                Icon(Icons.lock_outline_rounded,size: 18,),
                                Container(
                                    margin: EdgeInsets.only(left: 12),
                                    child: Text('Password',style: TextStyle(color: Colors.black,fontSize: 18),))
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10),
                            child: TextField(
                              onChanged: (String password)=>loginBloc.add(PasswordEvent(password)),
                              inputFormatters: [ LengthLimitingTextInputFormatter(15),],
                              cursorColor: Colors.black,
                              controller: passwordController,
                              obscureText: _isHidden,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(
                                    _isHidden ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 35.0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    borderSide: BorderSide(
                                        color:Colors.black
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    borderSide: BorderSide(
                                        color:Colors.black
                                    )
                                ),
                                hintText: 'Type Password',
                              ),
                              style: TextStyle(color: Colors.black,fontFamily: 'an',fontWeight: FontWeight.normal),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot password?',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () { Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider<ForgotBloc>(
                                                create: (context) => ForgotBloc(),
                                                child:  Forgot()),
                                      ),
                                    );}
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 45,
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                color: Colors.black),
                            child:TextButton(
                              onPressed: (state.isPasswordValid && state.isEmailValid)
                                  ?()async{
                                _loaderState();
                            loginBloc.add(OnLoginSuccessEvent(emailController.text, passwordController.text));
                            }:() {_check();},
                              child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),),
                          ),

                        ],
                      ),
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
