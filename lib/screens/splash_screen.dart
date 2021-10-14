import 'package:flutter/material.dart';
import 'landing_screen.dart';
class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async{
   await Future.delayed(Duration(milliseconds: 1500 ),(){});
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LandingScreen()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xFFFFFFFF),
         body: Center(
           child: Image.asset('assets/images/ANERT.png'),
         ),
      
    );
  }
}