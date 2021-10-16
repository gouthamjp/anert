import 'package:anert/models/user_model.dart';
import 'package:anert/screens/form_screens/name_of_institution_screen.dart';
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
      return NameOfInstitution();
    }
  }
}
