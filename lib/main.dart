import 'package:anert/models/user_model.dart';
import 'package:anert/screens/landing_screen.dart';
import 'package:anert/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:anert/screens/option_selection.dart';
import 'package:anert/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anert/screens/wrapper.dart';

//Custom Imports
import './screens/landing_screen.dart';
import './constants.dart';
import 'package:anert/screens/form.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
      initialData: null,
      value: AuthService().userDet,
      child: MaterialApp(
        title: 'Smart TVM',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const FormPage(),
      ),
    );
  }
}
