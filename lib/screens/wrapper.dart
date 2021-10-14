import 'package:anert/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './landing_screen.dart';
import './form_screens/screen1.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      return LandingScreen();
    } else {
      return ScreenOne();
    }
  }
}
