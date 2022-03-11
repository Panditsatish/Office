import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);


  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, icon: Icon(Icons.arrow_back_sharp,color: Colors.black,)),

                      SizedBox(
                        width: 110,
                      ),
                      Text("About As",style:TextStyle(color: Colors.black,fontFamily: 'an',fontWeight: FontWeight.w600,fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    child: Image.asset('assets/images/ic_kict_1.png'),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Version Name : 1.9 - release",style:TextStyle(color: Colors.black,fontFamily: 'an',fontWeight: FontWeight.w500,fontSize: 18)),
                  Text("Version Code : 10",style:TextStyle(color: Colors.black,fontFamily: 'an',fontWeight: FontWeight.w500,fontSize: 18)),

                ],
              ),]
            ),
          ),
        ),
      ),
    );
  }
}
