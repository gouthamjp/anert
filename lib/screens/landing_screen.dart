import 'package:flutter/material.dart';

// custom imports
import '../constants.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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
                style: TextStyle(color: baseClr, fontSize: 40),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(18),
              child: const Text(
                'SMART TVM',
                style: TextStyle(
                    color: baseClr, fontSize: 45, fontFamily: fontBld),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'A Government initiated project for the\ndevelopment of city',
                style: TextStyle(color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 70),
                width: mquery.width * 0.9,
                height: mquery.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    print("hello");
                  },
                  child: const Text(
                    "Get started",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(primary: baseClr),
                )),
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                width: mquery.width * 0.9,
                height: mquery.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    print("hello2");
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                )),
            const Text(
              "By selecting one or the other, you are agreeing to the\nTerms of Services & Privacy Policy",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
