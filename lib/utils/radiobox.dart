import 'package:flutter/material.dart';
import '/constants.dart';

class RadioFieldBox extends StatefulWidget {
  final String labelText;
  final bool requiredornot;
  final Widget radioChild;
  
  RadioFieldBox(
      {
      required this.labelText,
      required this.requiredornot,
      required this.radioChild});
      

  @override
  _RadioFieldBoxState createState() => _RadioFieldBoxState();
}

class _RadioFieldBoxState extends State<RadioFieldBox> {
  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
    return Container(child:Column(
        children: [
          Row(
            children: [
              Text(widget.labelText,
                  textAlign: TextAlign.left, style: GreenTvmTheme.fieldHeading),
              Text(
                widget.requiredornot ? '*' : '',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: 0.005 * mquery.height,
          ),
          widget.radioChild,
       ],
      ),
      
    );
  }
}
