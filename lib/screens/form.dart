import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:anert/constants.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:anert/utils/FormFieldBox.dart';

class FormPage extends StatefulWidget {
  const FormPage({ Key? key }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenTvmTheme.themeAppbar(title: 'GREEN TVM',  context: context, showBackButton: true),
      backgroundColor: Colors.white,
      body:Column(
        children: [
          StepperCounter(maxCount: 3,currentElement: 2,),
          Text(
            'Site Inspection Details',
            textAlign: TextAlign.center,style: GreenTvmTheme.fieldHeading
          ),


      ],)
      
    );
  }
}