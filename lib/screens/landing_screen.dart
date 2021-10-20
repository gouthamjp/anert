import 'package:anert/constants.dart';
import 'package:anert/screens/form_screens/interested_screen.dart';
import 'package:anert/screens/form_screens/name_of_institution_screen.dart';
import 'package:anert/services/auth.dart';
import 'package:anert/screens/option_selection.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/authentication_textfield.dart';
import 'package:anert/utils/button.dart';
import 'package:anert/utils/authentication_textfield.dart';

class LandingScreen extends StatefulWidget {
  static String id = 'landing_screen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final AuthService _auth = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnackBar(String value) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: GreenTvmTheme.primaryBlue,
      content: Text(value),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Close',
        textColor: GreenTvmTheme.white,
        onPressed: scaffoldKey.currentState!.hideCurrentSnackBar,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset:true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: mquery.height,
          width: mquery.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: mquery.height * 0.25,
                  child: Image.asset('assets/images/ANERT.png')),
              Container(
                height: mquery.height * 0.07,
                margin: const EdgeInsets.all(6),
                child: const Text('GREEN TVM', style: GreenTvmTheme.frontTitle),
              ),
              Container(
                height: mquery.height * 0.07,
                margin: const EdgeInsets.all(6),
                child: const Text(
                    'A Government initiated project for \nthe development of city',
                    textAlign: TextAlign.center,
                    style: GreenTvmTheme.descriptionTextStyle),
              ),
              Container(
                width: mquery.width * 0.9,
                height: mquery.height * 0.07,
                margin: const EdgeInsets.all(15),
                child: AuthenticationTextField(
                    hintText: 'ID',
                    isObscure: false,
                    keyboardType: KeyboardType.ID,
                    controller: _emailController,
                    didEndTextEdit: () {}),
              ),
              Container(
                width: mquery.width * 0.9,
                height: mquery.height * 0.07,
                margin: const EdgeInsets.all(15),
                child: AuthenticationTextField(
                  hintText: 'Password',
                  isObscure: true,
                  keyboardType: KeyboardType.Password,
                  controller: _passwordController,
                  didEndTextEdit: () {},
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  width: mquery.width * 0.9,
                  height: mquery.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await _auth.signInEmailAndPass(
                            _emailController.text, _passwordController.text);
                      } catch (e) {
                        showSnackBar('Something went wrong');
                        //print(e);
                      }
                      
                    },
                    child: const Text(
                      "Login",
                      style: GreenTvmTheme.buttonTextStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: GreenTvmTheme.primaryBlue),
                  )),
              Container(
                width: mquery.width * 0.9,
                height: mquery.height * 0.07,
                child: Text(
                    "By selecting one or the other, you are agreeing to the\nTerms of Services & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: GreenTvmTheme.descriptionTextStyle),
              )
            ],
          ),
        ),
      ),
    );
  }
}
