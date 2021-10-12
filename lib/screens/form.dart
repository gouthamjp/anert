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
   final _buildignamecontroller  = TextEditingController();
   final _2ndcontroller  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GreenTvmTheme.themeAppbar(title: 'GREEN TVM',  context: context, showBackButton: true),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(0.05* mquery.width),
          child: Column(
            children: [
              StepperCounter(maxCount: 3,currentElement: 2,),
              SizedBox(
              height: 0.05*mquery.height,
              width: 0.05* mquery.width,
              ),
              Text(
                'Site Inspection Details',
                textAlign: TextAlign.center,style: GreenTvmTheme.pagedHeading
              ),
              SizedBox(
              height: 0.02*mquery.height,
              ),
              Row(
                children: [
                  Text(
                    'Name of building',
                    textAlign: TextAlign.left,style: GreenTvmTheme.fieldHeading
                  ),
                ],
              ),
              SizedBox(
              height: 0.01*mquery.height,
              ),
              FormFieldBox(
                hintText: 'Name of Building',
                keyboardType: KeyboardType.Text_,
                controller: _buildignamecontroller,
                didEndTextEdit:(){},
              ),
              SizedBox(
              height: 0.02*mquery.height,
              ), 
              Row(
                children: [
                  Text(
                    'Category',
                    textAlign: TextAlign.left,style: GreenTvmTheme.fieldHeading
                  ),
                  Text(
                    '*',
                    textAlign: TextAlign.left,style: GreenTvmTheme.mandatorystar
                  ),
                ],
              ),
              SizedBox(
              height: 0.01*mquery.height,
              ), 
              FormFieldBox(
                hintText: 'Name of Building',
                keyboardType: KeyboardType.Text_,
                controller: _2ndcontroller,
                didEndTextEdit:(){},
              ),
              SizedBox(
              height: 0.02*mquery.height,
              ), 
      
          ],),
        ),
      )
      
    );
  }
}