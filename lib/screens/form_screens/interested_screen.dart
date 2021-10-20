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
<<<<<<< Updated upstream
  bool submit =false;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Submition'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('All the informations entered will be submitted'),
                Text('Would you like to conitinue'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
                submit=true;
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                submit=false;
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final detData = Provider.of<FormProvider>(context);
    final mquery = MediaQuery.of(context).size;
    //backend handling variables
    final institution = database.child('Institution/');
    final inspection = database.child('Inspection/');
    final evSite = database.child('EvSite/');
    //

    void submitfunc() async {
      
      detData.setSolarPV(_yesorno.toString().split('.').last);

      institution.push().set({
        'UserID': detData.baseForm.userID,
        'Name': detData.baseForm.houseName,
        'Deployment': detData.baseForm.deployment,
      });

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
          'Height': detData.siteInspection.height,
          'Load': detData.siteInspection.load,
          'Avg Consumption': detData.siteInspection.avgConsumption,
          'Connection Name': detData.siteInspection.eConnectionName,
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
          'Alt Contact Name': detData.evInspection.contactPerson2,
          'Alt PhnNo': detData.evInspection.phoneNum2,
          'Alt Email': detData.evInspection.email2,
          'Address': detData.evInspection.address,
          'Two Charging': detData.evInspection.twoCharging,
          'Remarks': detData.evInspection.remakrs
        });
      }

    }

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
=======

  //code to grab the location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  //
  @override
  Widget build(BuildContext context) {
    final detData = Provider.of<FormProvider>(context);
    final mquery = MediaQuery.of(context).size;
    //backend handling variables
    final inspection = database.child('Inspection/');
    final evSite = database.child('EvSite/');

    //
    bool submit = false;
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Submition'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('All the informations entered will be submitted'),
                  Text('Would you like to Submit'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                  submit = true;
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                  submit = false;
                },
              ),
            ],
          );
        },
      );
    }

    void submitfunc() async {
      //uploading images
      if (_image1 != null) {
        String base1 = basename(_image1!.path);

        var snap = await storage.child('Images/$base1').putFile(_image1!);

        _imageUrl1 = await snap.ref.getDownloadURL();
      }
      if (_image2 != null) {
        String base2 = basename(_image2!.path);
        var snap = await storage.child('Images/$base2').putFile(_image2!);
        _imageUrl2 = await snap.ref.getDownloadURL();
      }

      if (_image3 != null) {
        String base3 = basename(_image3!.path);
        var snap = await storage.child('Images/$base3').putFile(_image2!);
        _imageUrl3 = await snap.ref.getDownloadURL();
      }

      // latitude and longitude
      Position pos = await _determinePosition();
      String lat = pos.latitude.toString();
      String lng = pos.longitude.toString();
      _gmap = (_gmap! + lat + "," + lng);
      //

      // updating provider
      detData.setIntrest(_yesorno.toString().split('.').last, _gmap!,
          _imageUrl1!, _imageUrl2!, _imageUrl3!);
      //
      if (detData.formType == 0) {
        setState(() {
          _spinner = true;
        });
        await inspection.push().set({
          'uid': detData.siteInspection.userID,
          'building_name': detData.siteInspection.buildingName,
          'suitable': detData.siteInspection.deployment,
          'category': detData.siteInspection.category,
          'contact_name': detData.siteInspection.contactPerson,
          'desig': detData.siteInspection.designatoin,
          'phone': detData.siteInspection.phoneNum,
          'email': detData.siteInspection.email,
          'rented': detData.siteInspection.rented,
          'owner_name': detData.siteInspection.ownerName,
          'owner_phone': detData.siteInspection.ownerphn,
          'owner_email': detData.siteInspection.ownerEmail,
          'mounting': detData.siteInspection.mounting,
          'ambly_const': detData.siteInspection.assemblyConst,
          'parli_const': detData.siteInspection.parlimentConst,
          'dist': detData.siteInspection.district,
          'lb': detData.siteInspection.localBody,
          'ward_num': detData.siteInspection.wardNo,
          'ward_name': detData.siteInspection.wardName,
          'load': detData.siteInspection.load,
          'avg_cnsmptn': detData.siteInspection.avgConsumption,
          'conn_name': detData.siteInspection.eConnectionName,
          'period': detData.siteInspection.billingPeriod,
          'customer_type': detData.siteInspection.customerType,
          'conn_type': detData.siteInspection.connectionType,
          'length': detData.siteInspection.length,
          'breadth': detData.siteInspection.breadth,
          'area': detData.siteInspection.area,
          'prop_cap': detData.siteInspection.propCap,
          'rf_shape': detData.siteInspection.roofShape,
          'rf_mat': detData.siteInspection.roofCover,
          'mat_acc': detData.siteInspection.roofAccess,
          'sub_know': detData.siteInspection.subsidy,
          'reason': detData.siteInspection.disintrest,
          'remarks': detData.siteInspection.remark,
          'intrst': detData.siteInspection.solarPV,
          'gps': detData.siteInspection.gps,
          'img1': detData.siteInspection.img1,
          'img2': detData.siteInspection.img2,
          'img3': detData.siteInspection.img3,
        });
        setState(() {
          _spinner = false;
        });
      } else {
        setState(() {
          _spinner = true;
        });
        await evSite.push().set({
          'uid': detData.evInspection.userID,
          'building_name': detData.evInspection.buildingName,
          'suitable': detData.evInspection.deployment,
          'category': detData.evInspection.category,
          'contact_name': detData.evInspection.contactPerson,
          'desig': detData.evInspection.designatoin,
          'phone': detData.evInspection.phoneNum,
          'email': detData.evInspection.email,
          'rented': detData.evInspection.rented,
          'owner_name': detData.evInspection.ownerName,
          'owner_phone': detData.evInspection.ownerPhn,
          'owner_email': detData.evInspection.ownerEmail,
          'owner_address': detData.evInspection.ownerAddress,
          'ward_num': detData.evInspection.wardNo,
          'ward_name': detData.evInspection.wardName,
          'provision': detData.evInspection.twoCharging,
          'remarks': detData.evInspection.remakrs,
          'intrst': detData.evInspection.solarPV,
          'gps': detData.evInspection.gps,
          'img1': detData.evInspection.img1,
          'img2': detData.evInspection.img2,
          'img3': detData.evInspection.img3,
        });
        setState(() {
          _spinner = false;
        });
        print('cehck');
      }
    }

    return ModalProgressHUD(
      inAsyncCall: _spinner,
      child: Scaffold(
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
=======
                      ],
                    )),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final image1 = await ImagePicker()
                              .getImage(source: ImageSource.camera);
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        print(_image2);
                        final image2 = await ImagePicker()
                            .getImage(source: ImageSource.camera);

                        setState(() {
                          _image2 = image2 == null ? null : File(image2.path);
=======
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          print(_image2);
                          final image2 = await ImagePicker()
                              .getImage(source: ImageSource.camera);

                          setState(() {
                            _image2 = image2 == null ? null : File(image2.path);
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final image3 = await ImagePicker()
                            .getImage(source: ImageSource.camera);
=======
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final image3 = await ImagePicker()
                              .getImage(source: ImageSource.camera);
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
                  ),
                ],
              ),
              Button(
                  onpress: () async {
                    _showMyDialog();
                    if(submit){
                    submitfunc();
                    Navigator.pushNamedAndRemoveUntil(
          context, NameOfInstitution.id, (route) => false);
                    }
                  },
                  text: 'SUBMIT')
            ],
=======
                  ],
                ),
                Button(
                    onpress: () async {
                      _showMyDialog();
                      if (submit) {
                        submitfunc();
                        Navigator.pushNamedAndRemoveUntil(
                            context, OptionSelection.id, (route) => false);
                      }
                    },
                    text: 'SUBMIT')
              ],
            ),
>>>>>>> Stashed changes
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
