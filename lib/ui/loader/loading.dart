import 'package:flutter/material.dart';


void main(){
  runApp(Loading());
}

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffa4a4a4),
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
        ),
      ),
    );
  }
}
