import 'package:anert/constants.dart';
import 'package:anert/services/auth.dart';
import 'package:anert/screens/option_selection.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/authentication_textfield.dart';
import 'package:anert/utils/button.dart';
import 'package:anert/utils/authentication_textfield.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final AuthService _auth = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: mquery.height,
        width: mquery.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/ANERT.png')
            ),
            Container(
              margin: const EdgeInsets.all(6),
              child: const Text(
                'GREEN TVM',
                style: GreenTvmTheme.frontTitle),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              child: const Text(
                  'A Government initiated project for \nthe development of city',
                  textAlign: TextAlign.center,
                  style: GreenTvmTheme.descriptionTextStyle),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: AuthenticationTextField(
                  hintText: 'ID',
                  isObscure: false,
                  keyboardType: KeyboardType.ID,
                  controller: _emailController,
                  didEndTextEdit: () {}),
            ),
            Container(
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
                    await _auth.signInEmailAndPass(
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text(
                    "Login",
                    style: GreenTvmTheme.buttonTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: GreenTvmTheme.primaryBlue),
                )),

            const Text(
                "By selecting one or the other, you are agreeing to the\nTerms of Services & Privacy Policy",
                textAlign: TextAlign.center,
                style: GreenTvmTheme.descriptionTextStyle)
          ],
        ),
      ),
    );
  }
}
