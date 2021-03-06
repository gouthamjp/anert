import 'package:anert/models/user_model.dart';
import 'package:anert/screens/option_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './landing_screen.dart';

class Wrapper extends StatelessWidget {
  static String id = 'wrapper';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      return LandingScreen();
    } else {
      return OptionSelection();
    }
  }
}
