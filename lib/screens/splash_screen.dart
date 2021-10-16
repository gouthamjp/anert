import 'package:anert/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'landing_screen.dart';

class Splash extends StatefulWidget {
  static String id = 'sp_screen';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacementNamed(context, Wrapper.id);
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
