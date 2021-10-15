import 'package:anert/services/auth.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () async {
          await _auth.signOut();
        },
        child: Text('Sign out'),
      )),
    );
  }
}
