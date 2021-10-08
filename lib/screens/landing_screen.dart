import 'package:anert/constants.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/authentication_textfield.dart';
import 'package:anert/utils/button.dart';



class LandingScreen extends StatefulWidget {
  const LandingScreen({ Key? key }) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
              child: const Text(
                'LOGO',
                style: TextStyle(color: Colors.indigo, fontSize: 40),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(18),
              child: const Text(
                'SMART TVM',
                style: GreenTvmTheme.frontTitle),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'A Government initiated project for \nthe development of city',
                textAlign: TextAlign.center,style: GreenTvmTheme.descriptionTextStyle
              ),
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
            Button(
            onpress: (){
                print('Hello2');
            }, 
            text: 'LOGIN'),
            const Text(
              "By selecting one or the other, you are agreeing to the\nTerms of Services & Privacy Policy",
              textAlign: TextAlign.center,
              style: GreenTvmTheme.descriptionTextStyle
            )
          ],
        ),
      ),
    );
  }
}
