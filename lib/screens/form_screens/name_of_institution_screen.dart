import 'package:anert/constants.dart';
import 'package:anert/providers/form_provider.dart';
import 'package:anert/screens/form_screens/ev_site.dart';
import 'package:anert/screens/form_screens/inspection_site.dart';
import 'package:anert/screens/option_selection.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/button.dart';
import 'package:anert/utils/FormFieldBox.dart';
import 'package:anert/utils/radiobox.dart';
import 'package:provider/provider.dart';
import 'package:anert/models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:anert/globals.dart' as g;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

enum Yesorno { yes, no }
enum Option { solar, ev }

class NameOfInstitution extends StatefulWidget {
  static String id = 'nameofinstitution_screen';
  final Option option;
  NameOfInstitution({required this.option});
  @override
  _NameOfInstitutionState createState() => _NameOfInstitutionState();
}

class _NameOfInstitutionState extends State<NameOfInstitution> {
  File? _image1;
  File? _image2;
  File? _image3;
  String? _imageUrl1 = '';
  String? _imageUrl2 = '';
  String? _imageUrl3 = '';
    final String imageurl = 'assets/images/download.png';
  final _formKey = GlobalKey<FormState>();
  final _buildignamecontroller = TextEditingController();
  bool _spinner = false;
  Yesorno? _yesorno = Yesorno.yes;
  //backend handling variables
  final database = FirebaseDatabase.instance.reference();
  //
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnackBar(String value) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Color(0xFF333333),
      content: Text(value, style: TextStyle(fontSize: 14)),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Close',
        textColor: GreenTvmTheme.white,
        onPressed: scaffoldKey.currentState!.hideCurrentSnackBar,
      ),
    ));
  }

  void test() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    //backend handling variables
    final inspection = database.child('Inspection/');
    final evSite = database.child('EvSite/');
    //
    final user = Provider.of<CustomUser?>(context);
    final detData = Provider.of<FormProvider>(context);
    final mquery = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: _spinner,
      child: Scaffold(
        resizeToAvoidBottomInset: _yesorno==Yesorno.yes?true: false,
        key: scaffoldKey,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //height: mquery.height * 0.15,
                        child: Form(
                          key: _formKey,
                          child: FormFieldBox(
                            onSavedField: (value) {},
                            onChanged: (value) {},
                            onSubmitingField: (value) {},
                            labelText: 'Name of Building',
                            hintText: 'Enter name of building',
                            keyboardType: KeyboardType.Text_,
                            controller: _buildignamecontroller,
                            requiredornot: true,
                            //focusNode: _buildignamenode,
                            didEndTextEdit: () {},
                          ),
                        ),
                      ),
                      RadioFieldBox(
                          labelText: 'Is it suitable for deployement?',
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
                              _yesorno == Yesorno.no
                                  ? Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              final image1 = await ImagePicker()
                                                  .getImage(
                                                      source:
                                                          ImageSource.camera);

                                              setState(() {
                                                _image1 = image1 == null
                                                    ? null
                                                    : File(image1.path);
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
                                                  .getImage(
                                                      source:
                                                          ImageSource.camera);

                                              setState(() {
                                                _image2 = image2 == null
                                                    ? null
                                                    : File(image2.path);

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
                                                  .getImage(
                                                      source:
                                                          ImageSource.camera);

                                              setState(() {
                                                _image3 = image3 == null
                                                    ? null
                                                    : File(image3.path);
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
                                    )
                                  : Container(),
                            ],
                          )),
                      Button(
                          onpress: () async {
                            try {
                              g.Buildingname = _buildignamecontroller.text;

                              detData.setName(
                                  user?.id,
                                  _buildignamecontroller.text,
                                  _yesorno.toString().split('.').last);
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              if (_yesorno == Yesorno.yes) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            widget.option == Option.ev
                                                ? EvPage()
                                                : InspectionPage()));
                              } else {
                                if (detData.formType == 0) {
                                  setState(() {
                                    _spinner = true;
                                  });
                                  await inspection.push().set({
                                    'uid': detData.siteInspection.userID,
                                    'building_name':
                                        detData.siteInspection.buildingName,
                                    'suitable':
                                        detData.siteInspection.deployment,
                                    'category': detData.siteInspection.category,
                                    'contact_name':
                                        detData.siteInspection.contactPerson,
                                    'desig': detData.siteInspection.designatoin,
                                    'phone': detData.siteInspection.phoneNum,
                                    'email': detData.siteInspection.email,
                                    'rented': detData.siteInspection.rented,
                                    'owner_name':
                                        detData.siteInspection.ownerName,
                                    'owner_phone':
                                        detData.siteInspection.ownerphn,
                                    'owner_email':
                                        detData.siteInspection.ownerEmail,
                                    'mounting': detData.siteInspection.mounting,
                                    'ambly_const':
                                        detData.siteInspection.assemblyConst,
                                    'parli_const':
                                        detData.siteInspection.parlimentConst,
                                    'dist': detData.siteInspection.district,
                                    'lb': detData.siteInspection.localBody,
                                    'ward_num': detData.siteInspection.wardNo,
                                    'ward_name':
                                        detData.siteInspection.wardName,
                                    'load': detData.siteInspection.load,
                                    'avg_cnsmptn':
                                        detData.siteInspection.avgConsumption,
                                    'conn_name':
                                        detData.siteInspection.eConnectionName,
                                    'period':
                                        detData.siteInspection.billingPeriod,
                                    'customer_type':
                                        detData.siteInspection.customerType,
                                    'conn_type':
                                        detData.siteInspection.connectionType,
                                    'length': detData.siteInspection.length,
                                    'breadth': detData.siteInspection.breadth,
                                    'area': detData.siteInspection.area,
                                    'prop_cap': detData.siteInspection.propCap,
                                    'rf_shape':
                                        detData.siteInspection.roofShape,
                                    'rf_mat': detData.siteInspection.roofCover,
                                    'mat_acc':
                                        detData.siteInspection.roofAccess,
                                    'sub_know': detData.siteInspection.subsidy,
                                    'reason': detData.siteInspection.disintrest,
                                    'promocode':
                                        detData.siteInspection.promocode,
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
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OptionSelection(
                                        issubmitted: true,
                                      ),
                                    ),
                                    (route) => false,
                                  );
                                  showSnackBar('Details entered successfully');
                                } else {
                                  setState(() {
                                    _spinner = true;
                                  });
                                  await evSite.push().set({
                                    'uid': detData.evInspection.userID,
                                    'building_name':
                                        detData.evInspection.buildingName,
                                    'suitable': detData.evInspection.deployment,
                                    'category': detData.evInspection.category,
                                    'contact_name':
                                        detData.evInspection.contactPerson,
                                    'desig': detData.evInspection.designatoin,
                                    'phone': detData.evInspection.phoneNum,
                                    'email': detData.evInspection.email,
                                    'rented': detData.evInspection.rented,
                                    'owner_name':
                                        detData.evInspection.ownerName,
                                    'owner_phone':
                                        detData.evInspection.ownerPhn,
                                    'owner_email':
                                        detData.evInspection.ownerEmail,
                                    'owner_address':
                                        detData.evInspection.ownerAddress,
                                    'ambly_const':
                                        detData.evInspection.assemblyConst,
                                    'parli_const':
                                        detData.evInspection.parlimentConst,
                                    'dist': detData.evInspection.district,
                                    'lb': detData.evInspection.localBody,
                                    'ward_num': detData.evInspection.wardNo,
                                    'ward_name': detData.evInspection.wardName,
                                    'provision':
                                        detData.evInspection.twoCharging,
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
                                }
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OptionSelection(
                                      issubmitted: true,
                                    ),
                                  ),
                                  (route) => false,
                                );
                                showSnackBar('Details entered successfully');
                              }
                            } catch (e) {
                              showSnackBar('Something went wrong');
                              _spinner = false;
                            }

                            _buildignamecontroller.clear();
                          },
                          text: _yesorno == Yesorno.yes ? 'NEXT' : 'SUBMIT')
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
