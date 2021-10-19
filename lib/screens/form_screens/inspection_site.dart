import 'package:anert/screens/form_screens/interested_screen.dart';
import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:anert/constants.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:anert/utils/FormFieldBox.dart';
import 'package:anert/utils/radiobox.dart';
import 'package:anert/utils/button.dart';
import 'package:provider/provider.dart';
import 'package:anert/models/user_model.dart';
import 'package:anert/providers/form_provider.dart';
import 'package:anert/utils/yesopentextfield.dart';
import 'package:anert/globals.dart' as g;

enum Category { residential, commercial, government }
enum Mounting { roof, ground }
enum Yesorno { yes, no }
enum TypeofCustomer { lt, ht }
enum ElectricalConnection { onephase, threephase }
enum RoofShape { flat, tilted, others }
enum RoofCover { concrete, tiles, asbetos, others }
enum Accessibility { crane, scaffolding, stairs, notaccessible }

class InspectionPage extends StatefulWidget {
  static String id = 'inspection_screen';
  @override
  _InspectionPageState createState() => _InspectionPageState();
}

class _InspectionPageState extends State<InspectionPage> {
  final _formKey = GlobalKey<FormState>();
  final _buildignamecontroller = TextEditingController();
  final _notcpcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _designationcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _heightcontroller = TextEditingController();
  final _loadcontroller = TextEditingController();
  final _avgconsumption = TextEditingController();
  final _econncontroller = TextEditingController();
  final _billingcontroller = TextEditingController();
  final _shadecontroller = TextEditingController();
  final _remarkcontroller = TextEditingController();
  final _rentednamecontroller = TextEditingController();
  final _rentedphonecontroller = TextEditingController();
  final _rentedemailcontroller = TextEditingController();
  final _othersspecifycontroller = TextEditingController();
  final _othersspecifyshapecontroller = TextEditingController();
  final _wardnumbercontroller = TextEditingController();
  final _wardnamecontroller = TextEditingController();
  
  
  Category? _category = Category.residential;
  Mounting? _mounting = Mounting.roof;
  Yesorno? _rented = Yesorno.no;
  TypeofCustomer? _typeofCustomer = TypeofCustomer.lt;
  ElectricalConnection? _electricalConnection = ElectricalConnection.onephase;
  RoofShape? _roofShape = RoofShape.flat;
  RoofCover? _roofCover = RoofCover.concrete;
  Accessibility? _accessibility = Accessibility.crane;
  //final _buildignamenode = FocusNode();
  // final _notcpnode = FocusNode();
  String data0 = '';
  String data1 = '';

  void test() {
    _formKey.currentState!.save();
    data0 = _buildignamecontroller.text;
    data1 = _notcpcontroller.text;
  }
  
  void intialfunc(){
    _buildignamecontroller.text=g.Buildingname;
  }

    @override
  void initState() {
    super.initState();
    intialfunc();
  }

  @override
  Widget build(BuildContext context) {
    final detData = Provider.of<FormProvider>(context);
    final user = Provider.of<CustomUser?>(context);
    final mquery = MediaQuery.of(context).size;
    
    
    return Scaffold(
        appBar: GreenTvmTheme.themeAppbar(
            title: 'GREEN TVM', context: context, showBackButton: true),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(0.05 * mquery.width),
              child: Column(children: [
                StepperCounter(
                  maxCount: 3,
                  currentElement: 2,
                ),
                SizedBox(
                  height: 0.05 * mquery.height,
                  width: 0.05 * mquery.width,
                ),
                Text('Solar Site Details',
                    textAlign: TextAlign.center,
                    style: GreenTvmTheme.pagedHeading),
                SizedBox(
                  height: 0.02 * mquery.height,
                ),
                Form(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Name of Building',
                      hintText: 'Name of Building',
                      keyboardType: KeyboardType.Text_,
                      controller: _buildignamecontroller,
                      requiredornot: true,
                      //focusNode: _buildignamenode,
                      didEndTextEdit: () {},
                    ),
                    RadioFieldBox(
                      labelText: 'Category',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('RESIDENTIAL'),
                            leading: Radio<Category>(
                              value: Category.residential,
                              groupValue: _category,
                              onChanged: (Category? value) {
                                setState(() {
                                  _category = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('COMMERCIAL/PRIVATE'),
                            leading: Radio<Category>(
                              value: Category.commercial,
                              groupValue: _category,
                              onChanged: (Category? value) {
                                setState(() {
                                  _category = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('GOVERNMENT BUILDING'),
                            leading: Radio<Category>(
                              value: Category.government,
                              groupValue: _category,
                              onChanged: (Category? value) {
                                setState(() {
                                  _category = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Name of the Contact Person',
                      hintText: 'Enter Name',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _notcpcontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Designation',
                      hintText: 'Enter Text Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _designationcontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Phone Number',
                      hintText: 'Enter Number Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Number_,
                      controller: _phonecontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Email Address',
                      hintText: 'Enter Email Here',
                      requiredornot: false,
                      keyboardType: KeyboardType.Text_,
                      controller: _emailcontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    RadioFieldBox(
                      labelText: 'Whether Rented or not?',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('YES'),
                            leading: Radio<Yesorno>(
                              value: Yesorno.yes,
                              groupValue: _rented,
                              onChanged: (Yesorno? value) {
                                setState(() {
                                  _rented = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('NO'),
                            leading: Radio<Yesorno>(
                              value: Yesorno.no,
                              groupValue: _rented,
                              onChanged: (Yesorno? value) {
                                setState(() {
                                  _rented = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    YesOpenFormFieldBox(
                        hintText: 'Enter name',
                        labelText: 'Name of Owner',
                        keyboardType: KeyboardType1.Text_,
                        controller: _rentednamecontroller,
                        didEndTextEdit: () {},
                        requiredornot: true,
                        onSavedField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    YesOpenFormFieldBox(
                        hintText: 'Enter Phone number ',
                        labelText: 'Phone number of Owner',
                        keyboardType: KeyboardType1.Number_,
                        controller: _rentedphonecontroller,
                        didEndTextEdit: () {},
                        requiredornot: false,
                        onSavedField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    YesOpenFormFieldBox(
                        hintText: 'Enter email',
                        labelText: 'Email of Owner',
                        keyboardType: KeyboardType1.Text_,
                        controller: _rentedemailcontroller,
                        didEndTextEdit: () {},
                        requiredornot: false,
                        onSavedField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    RadioFieldBox(
                      labelText: 'Mounting',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('ROOF'),
                            leading: Radio<Mounting>(
                              value: Mounting.roof,
                              groupValue: _mounting,
                              onChanged: (Mounting? value) {
                                setState(() {
                                  _mounting = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('GROUND'),
                            leading: Radio<Mounting>(
                              value: Mounting.ground,
                              groupValue: _mounting,
                              onChanged: (Mounting? value) {
                                setState(() {
                                  _mounting = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Wardname and number insert
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Ward Number',
                      hintText: 'Enter Number Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _wardnumbercontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Ward Name',
                      hintText: 'Enter Ward Name Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _wardnamecontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    //end insert
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Connected Load',
                      hintText: 'Enter in Kwh',
                      requiredornot: true,
                      keyboardType: KeyboardType.Number_,
                      controller: _loadcontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Monthly Average Consumption',
                      hintText: 'Enter in KWh',
                      requiredornot: true,
                      keyboardType: KeyboardType.Number_,
                      controller: _avgconsumption,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Name of electrical connection',
                      hintText: 'Enter Name',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _econncontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Billing Period',
                      hintText: 'Enter duration',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _billingcontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    RadioFieldBox(
                      labelText: 'Type of Customer',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('LT'),
                            leading: Radio<TypeofCustomer>(
                              value: TypeofCustomer.lt,
                              groupValue: _typeofCustomer,
                              onChanged: (TypeofCustomer? value) {
                                setState(() {
                                  _typeofCustomer = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('HT'),
                            leading: Radio<TypeofCustomer>(
                              value: TypeofCustomer.ht,
                              groupValue: _typeofCustomer,
                              onChanged: (TypeofCustomer? value) {
                                setState(() {
                                  _typeofCustomer = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    RadioFieldBox(
                      labelText: 'Type of Electrical Connection',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('SINGLE PHASE'),
                            leading: Radio<ElectricalConnection>(
                              value: ElectricalConnection.onephase,
                              groupValue: _electricalConnection,
                              onChanged: (ElectricalConnection? value) {
                                setState(() {
                                  _electricalConnection = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('3 PHASE'),
                            leading: Radio<ElectricalConnection>(
                              value: ElectricalConnection.threephase,
                              groupValue: _electricalConnection,
                              onChanged: (ElectricalConnection? value) {
                                setState(() {
                                  _electricalConnection = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Shade free area (in m2)',
                      hintText: 'Enter in KWh',
                      requiredornot: true,
                      keyboardType: KeyboardType.Number_,
                      controller: _shadecontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    RadioFieldBox(
                      labelText: 'Roof Shape',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('FLAT ROOF'),
                            leading: Radio<RoofShape>(
                              value: RoofShape.flat,
                              groupValue: _roofShape,
                              onChanged: (RoofShape? value) {
                                setState(() {
                                  _roofShape = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('TILTED ROOF'),
                            leading: Radio<RoofShape>(
                              value: RoofShape.tilted,
                              groupValue: _roofShape,
                              onChanged: (RoofShape? value) {
                                setState(() {
                                  _roofShape = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('OTHERS PLEASE SPECIFY'),
                            leading: Radio<RoofShape>(
                              value: RoofShape.others,
                              groupValue: _roofShape,
                              onChanged: (RoofShape? value) {
                                setState(() {
                                  _roofShape = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    YesOpenFormFieldBox(
                        hintText: 'Enter here ',
                        labelText: 'Enter the type of roofing material',
                        keyboardType: KeyboardType1.Number_,
                        controller: _othersspecifyshapecontroller,
                        didEndTextEdit: () {},
                        requiredornot: false,
                        onSavedField: (value) {},
                        yesorno: _roofShape == RoofShape.others ? true : false),
                    RadioFieldBox(
                      labelText: 'Roof Covering Material',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('CONCRETE'),
                            leading: Radio<RoofCover>(
                              value: RoofCover.concrete,
                              groupValue: _roofCover,
                              onChanged: (RoofCover? value) {
                                setState(() {
                                  _roofCover = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('TILES'),
                            leading: Radio<RoofCover>(
                              value: RoofCover.tiles,
                              groupValue: _roofCover,
                              onChanged: (RoofCover? value) {
                                setState(() {
                                  _roofCover = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('ASBETOS SHEETS'),
                            leading: Radio<RoofCover>(
                              value: RoofCover.asbetos,
                              groupValue: _roofCover,
                              onChanged: (RoofCover? value) {
                                setState(() {
                                  _roofCover = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('OTHERS PLEASE SPECIFY'),
                            leading: Radio<RoofCover>(
                              value: RoofCover.others,
                              groupValue: _roofCover,
                              onChanged: (RoofCover? value) {
                                setState(() {
                                  _roofCover = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    YesOpenFormFieldBox(
                        hintText: 'Enter here ',
                        labelText: 'Enter the type of roofing material',
                        keyboardType: KeyboardType1.Number_,
                        controller: _othersspecifycontroller,
                        didEndTextEdit: () {},
                        requiredornot: false,
                        onSavedField: (value) {},
                        yesorno: _roofCover == RoofCover.others ? true : false),
                    RadioFieldBox(
                      labelText: 'Accessibilty of Roof',
                      requiredornot: true,
                      radioChild: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('CRANE NECESSAARY'),
                            leading: Radio<Accessibility>(
                              value: Accessibility.crane,
                              groupValue: _accessibility,
                              onChanged: (Accessibility? value) {
                                setState(() {
                                  _accessibility = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('SCAFFOLDING NECESSAARY'),
                            leading: Radio<Accessibility>(
                              value: Accessibility.scaffolding,
                              groupValue: _accessibility,
                              onChanged: (Accessibility? value) {
                                setState(() {
                                  _accessibility = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('STAIRS AVAILABLE'),
                            leading: Radio<Accessibility>(
                              value: Accessibility.stairs,
                              groupValue: _accessibility,
                              onChanged: (Accessibility? value) {
                                setState(() {
                                  _accessibility = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('NOT ACCESSIBLE'),
                            leading: Radio<Accessibility>(
                              value: Accessibility.notaccessible,
                              groupValue: _accessibility,
                              onChanged: (Accessibility? value) {
                                setState(() {
                                  _accessibility = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Remarks',
                      hintText: 'Enter Remarks Here',
                      requiredornot: false,
                      keyboardType: KeyboardType.Text_,
                      controller: _remarkcontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    
                    Button(
                        //iugi
                        onpress: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            Navigator.pushNamed(context, InterestedScreen.id);
                          }

                          // entering data to the provider

                          if (_rented == Yesorno.no) {
                            detData.setTwo(
                                user!.id,
                                _buildignamecontroller.text,
                                _category.toString().split('.').last,
                                _notcpcontroller.text,
                                _designationcontroller.text,
                                _phonecontroller.text,
                                _emailcontroller.text,
                                _rented.toString().split('.').last,
                                _mounting.toString().split('.').last,
                                _heightcontroller.text,
                                _loadcontroller.text,
                                _avgconsumption.text,
                                _econncontroller.text,
                                _billingcontroller.text,
                                _typeofCustomer.toString().split('.').last,
                                _electricalConnection
                                    .toString()
                                    .split('.')
                                    .last,
                                _shadecontroller.text,
                                _roofShape.toString().split('.').last,
                                (_roofCover == RoofCover.others)
                                    ? _othersspecifycontroller.text
                                    : _roofCover.toString().split('.').last,
                                _accessibility.toString().split('.').last,
                                _remarkcontroller.text);
                          } else {
                            detData.setTwoRented(
                                user!.id,
                                _buildignamecontroller.text,
                                _category.toString().split('.').last,
                                _notcpcontroller.text,
                                _designationcontroller.text,
                                _phonecontroller.text,
                                _emailcontroller.text,
                                _rented.toString().split('.').last,
                                _rentednamecontroller.text,
                                _rentedphonecontroller.text,
                                _rentedemailcontroller.text,
                                _mounting.toString().split('.').last,
                                _heightcontroller.text,
                                _loadcontroller.text,
                                _avgconsumption.text,
                                _econncontroller.text,
                                _billingcontroller.text,
                                _typeofCustomer.toString().split('.').last,
                                _electricalConnection
                                    .toString()
                                    .split('.')
                                    .last,
                                _shadecontroller.text,
                                _roofShape.toString().split('.').last,
                                (_roofCover == RoofCover.others)
                                    ? _othersspecifycontroller.text
                                    : _roofCover.toString().split('.').last,
                                _accessibility.toString().split('.').last,
                                _remarkcontroller.text);
                          }

                          print(detData.siteInspection.ownerName);

                          //
                        },
                        text: 'NEXT')
                  ]),
                ),
              ])),
        ));
  }
}
