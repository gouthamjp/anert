import 'package:flutter/material.dart';

//Custom Imports
import './screens/landing_screen.dart';
import './constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart TVM',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        
      ),
      home: const LandingScreen(),
    );
  }
}
