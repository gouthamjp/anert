import 'package:anert/constants.dart';
import 'package:anert/screens/option_selection.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/button.dart';
import 'package:provider/provider.dart';
import 'package:anert/providers/form_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

enum Yesorno { yes, no }

class InterestedScreen extends StatefulWidget {
  static String id = 'interested_screen';

  @override
  _InterestedScreenState createState() => _InterestedScreenState();
}

class _InterestedScreenState extends State<InterestedScreen> {
  bool _spinner = false;
  final database = FirebaseDatabase.instance.reference();
  final storage = FirebaseStorage.instance.ref();
  File? _image1;
  File? _image2;
  File? _image3;
  String? _gmap = "https://maps.google.com/?q=";
  String? _imageUrl1 = '';
  String? _imageUrl2 = '';
  String? _imageUrl3 = '';
  final String imageurl = 'assets/images/download.png';
  bool submit = true;
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

  final scaffoldKey = GlobalKey<ScaffoldState>();

   void showSnackBar(String value) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Colors.grey,
      content: Text(value,style: TextStyle(fontSize: 17)),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Close',
        textColor: GreenTvmTheme.white,
        onPressed: scaffoldKey.currentState!.hideCurrentSnackBar,
      ),
    ));
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

    Future<void> submitfunc() async {
        setState(() {
          _spinner = true;
        });
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
      detData.setIntrest( _gmap!,
          _imageUrl1!, _imageUrl2!, _imageUrl3!);
      //
      if (detData.formType == 0) {
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
          'promocode': detData.siteInspection.promocode,
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
          'ambly_const': detData.evInspection.assemblyConst,
          'parli_const': detData.evInspection.parlimentConst,
          'dist': detData.evInspection.district,
          'lb': detData.evInspection.localBody,
          'ward_num': detData.evInspection.wardNo,
          'ward_name': detData.evInspection.wardName,
          'provision': detData.evInspection.twoCharging,
          'length': detData.evInspection.length,
          'breadth': detData.evInspection.breadth,
          'area': detData.evInspection.area,
          'remarks': detData.evInspection.remakrs,
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
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OptionSelection(issubmitted: true,),),(route) => false,);
    }

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
                onPressed: () async {
                  Navigator.of(context).pop();
                  try{
                    await submitfunc();
                    showSnackBar("Details entered successfully'");
                  }
                  catch(e){
                    showSnackBar('Something went wrong');
                    _spinner=false;
                  }
                  
                  
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

    return ModalProgressHUD(
      inAsyncCall: _spinner,
      child: Scaffold(
        key:scaffoldKey,
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
              children: [
                Flexible(
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
                      Text('Upload Images',
                          textAlign: TextAlign.center,
                          style: GreenTvmTheme.pagedHeading),
                      SizedBox(
                        height: 0.02 * mquery.height,
                      ),
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
                            _showMyDialog();
                           
                          },
                          text: 'SUBMIT')
                    ],
                  ),
                ),
              ],
            ),
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
