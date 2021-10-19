import 'package:anert/constants.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/button.dart';
import 'package:anert/utils/radiobox.dart';
import 'package:anert/utils/button.dart';
import 'package:provider/provider.dart';
import 'package:anert/models/user_model.dart';
import 'name_of_institution_screen.dart';
import 'package:anert/providers/form_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

enum Yesorno { yes, no }

class InterestedScreen extends StatefulWidget {
  static String id = 'interested_screen';

  @override
  _InterestedScreenState createState() => _InterestedScreenState();
}

class _InterestedScreenState extends State<InterestedScreen> {
  final _formKey = GlobalKey<FormState>();

  final database = FirebaseDatabase.instance.reference();

  final _buildignamecontroller = TextEditingController();
  Yesorno? _yesorno = Yesorno.yes;
  File? _image1;
  File? _image2;
  File? _image3;
  final String imageurl = 'assets/images/download.png';
  @override
  Widget build(BuildContext context) {
    final detData = Provider.of<FormProvider>(context);
    final mquery = MediaQuery.of(context).size;
    //backend handling variables
    final institution = database.child('Institution/');
    final inspection = database.child('Inspection/');
    final evSite = database.child('EvSite/');
    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GreenTvmTheme.themeAppbar(
          title: 'GREEN TVM', context: context, showBackButton: true),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: mquery.height,
        width: mquery.width,
        child: Container(
          margin: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StepperCounter(
                maxCount: 3,
                currentElement: 3,
              ),
              SizedBox(
                height: 0.05 * mquery.height,
                width: 0.05 * mquery.width,
              ),
              RadioFieldBox(
                  labelText:
                      'Whether you are interested\n for installing Solar PV?',
                  requiredornot: true,
                  radioChild: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('YES'),
                        leading: Radio<Yesorno>(
                          value: Yesorno.yes,
                          groupValue: _yesorno,
                          onChanged: (Yesorno? value) {
                            setState(() {
                              _yesorno = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('NO'),
                        leading: Radio<Yesorno>(
                          value: Yesorno.no,
                          groupValue: _yesorno,
                          onChanged: (Yesorno? value) {
                            setState(() {
                              _yesorno = value;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final image1 = await ImagePicker()
                            .getImage(source: ImageSource.camera);

                        setState(() {
                          _image1 = image1 == null ? null : File(image1.path);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        child: _image1 == null
                            ? Image.asset('$imageurl')
                            : Image.file(_image1!),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        print(_image2);
                        final image2 = await ImagePicker()
                            .getImage(source: ImageSource.camera);

                        setState(() {
                          _image2 = image2 == null ? null : File(image2.path);

                          print(_image2);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        child: _image2 == null
                            ? Image.asset('$imageurl')
                            : Image.file(_image2!),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final image3 = await ImagePicker()
                            .getImage(source: ImageSource.camera);

                        setState(() {
                          _image3 = image3 == null ? null : File(image3.path);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        child: _image3 == null
                            ? Image.asset('$imageurl')
                            : Image.file(_image3!),
                      ),
                    ),
                  ),
                ],
              ),
              Button(
                  onpress: () async {
                    if (detData.formType == 0) {
                      inspection.push().set({
                        'UserID': detData.siteInspection.userID,
                        'Building Name': detData.siteInspection.buildingName,
                        'Category': detData.siteInspection.category,
                        'Contact Person': detData.siteInspection.contactPerson,
                        'Designation': detData.siteInspection.designatoin,
                        'Phone Number': detData.siteInspection.phoneNum,
                        'Email': detData.siteInspection.email,
                        'Rented': detData.siteInspection.rented,
                        'Owner Name': detData.siteInspection.ownerName,
                        'Owner Phone': detData.siteInspection.ownerphn,
                        'Owner Email': detData.siteInspection.ownerEmail,
                        'Mounting': detData.siteInspection.mounting,
                        'Height': detData.siteInspection.height, //
                        'Load': detData.siteInspection.load,
                        'Avg Consumption':
                            detData.siteInspection.avgConsumption,
                        'Connection Name':
                            detData.siteInspection.eConnectionName,
                        'Billing Period': detData.siteInspection.billingPeriod,
                        'Customer Type': detData.siteInspection.connectionType,
                        'Shade Area': detData.siteInspection.sfreeArea,
                        'Roof Shape': detData.siteInspection.roofShape,
                        'Roof Cover': detData.siteInspection.roofCover,
                        'Roof Access': detData.siteInspection.roofAccess,
                        'Remark': detData.siteInspection.remark,
                      });
                    } else {
                      evSite.push().set({
                        'UserID': detData.evInspection.userID,
                        'Building Name': detData.evInspection.buildingName,
                        'Category': detData.evInspection.category,
                        'Contact Person': detData.evInspection.contactPerson,
                        'Designation': detData.evInspection.designatoin,
                        'Phone Number': detData.evInspection.phoneNum,
                        'Email': detData.evInspection.email,
                        'Rented': detData.evInspection.rented,
                        'Owner Name': detData.evInspection.ownerName,
                        'Owner Phone': detData.evInspection.ownerPhn,
                        'Owner Email': detData.evInspection.ownerEmail,
                        'Address': detData.evInspection.address,
                        'Two Charging': detData.evInspection.twoCharging,
                        'Remarks': detData.evInspection.remakrs
                      });
                    }

                    Navigator.pushNamedAndRemoveUntil(
                        context, NameOfInstitution.id, (route) => false);
                  },
                  text: 'SUBMIT')
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: GreenTvmTheme.secondaryGray,
            )),
      ),
    );
  }
}
