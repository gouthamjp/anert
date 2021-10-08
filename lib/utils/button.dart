import 'package:anert/constants.dart';
import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  
  Button({required this.onpress, required this.text});
  final Function() onpress;
  final String text;
  
  @override
    Widget build(BuildContext context) {
    final mquery= MediaQuery.of(context).size;
    return Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                width: mquery.width * 0.9,
                height: mquery.height * 0.07,
                child: ElevatedButton(
                  onPressed: onpress,
                  child: Text(
                    text,
                    style: GreenTvmTheme.buttonTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(primary: GreenTvmTheme.primaryBlue),
                )
      
    );
  }
}