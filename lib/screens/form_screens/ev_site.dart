import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:anert/constants.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:anert/utils/FormFieldBox.dart';
import 'package:anert/utils/radiobox.dart';
import 'package:anert/utils/button.dart';
import 'package:anert/screens/form_screens/interested_screen.dart';
import 'package:anert/utils/yesopentextfield.dart';
import 'package:provider/provider.dart';
import 'package:anert/models/user_model.dart';
import 'package:anert/providers/form_provider.dart';
import 'package:anert/globals.dart' as g;

enum Category { residential, commercial, government }
enum Yesorno { yes, no }

class EvPage extends StatefulWidget {
  static String id = 'ev_screen';

  @override
  _EvPageState createState() => _EvPageState();
}

class _EvPageState extends State<EvPage> {
  final _formKey = GlobalKey<FormState>();
  final _buildignamecontroller = TextEditingController();
  final _notcpcontroller = TextEditingController();
  final _notcp1controller = TextEditingController();
  final _phone1controller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _designationcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _email1controller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _remarkscontroller = TextEditingController();
  final _rentednamecontroller = TextEditingController();
  final _rentedphonecontroller = TextEditingController();
  final _rentedemailcontroller = TextEditingController();
  final _wardnumbercontroller = TextEditingController();
  final _wardnamecontroller = TextEditingController();

  Category? _category = Category.residential;
  Yesorno? _yesorno = Yesorno.yes;
  Yesorno? _rented = Yesorno.no;
  //final _buildignamenode = FocusNode();
  // final _notcpnode = FocusNode();
  String data0 = '';
  String data1 = '';
  final String imageurl = 'assets/images/download.png';
  void test() {
    _formKey.currentState!.save();
    data0 = _buildignamecontroller.text;
    data1 = _notcpcontroller.text;
  }

  void intialfunc() {
    _buildignamecontroller.text = g.Buildingname;
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
                Text('EV SITE',
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
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
                      labelText: 'Name of Building',
                      hintText: 'Name of Building',
                      keyboardType: KeyboardType.Text_,
                      readonly: true,
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
                            title: const Text('COMMERCIAL/PRIVATE BUILDING'),
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
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
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
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
                      labelText: 'Ward Name',
                      hintText: 'Enter Ward Name Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _wardnamecontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
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
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
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
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
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
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
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
                        hintText: 'Enter Name',
                        labelText: 'Name of Owner',
                        keyboardType: KeyboardType1.Text_,
                        controller: _rentednamecontroller,
                        didEndTextEdit: () {},
                        requiredornot: true,
                        onSavedField: (value) {},
                        onChanged: (value) {},
                        onSubmitingField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    YesOpenFormFieldBox(
                        hintText: 'Enter Phone number ',
                        labelText: 'Phone number of Owner',
                        keyboardType: KeyboardType1.Number_,
                        controller: _rentedphonecontroller,
                        didEndTextEdit: () {},
                        requiredornot: true,
                        onSavedField: (value) {},
                        onChanged: (value) {},
                        onSubmitingField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    YesOpenFormFieldBox(
                        hintText: 'Enter email',
                        labelText: 'Email of Owner',
                        keyboardType: KeyboardType1.Text_,
                        controller: _rentedemailcontroller,
                        didEndTextEdit: () {},
                        requiredornot: false,
                        onSavedField: (value) {},
                        onChanged: (value) {},
                        onSubmitingField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    YesOpenFormFieldBox(
                        hintText: 'Enter Address Here',
                        labelText: 'Address',
                        keyboardType: KeyboardType1.Text_,
                        controller: _addresscontroller,
                        didEndTextEdit: () {},
                        requiredornot: false,
                        onSavedField: (value) {},
                        onChanged: (value) {},
                        onSubmitingField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    RadioFieldBox(
                      labelText:
                          'Whether there is a provision for changing \ntwo vehicles at a time or not?',
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
                      ),
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      onChanged: (value) {},
                      onSubmitingField: (value) {},
                      labelText: 'Remarks',
                      hintText: 'Enter Remarks Here',
                      requiredornot: false,
                      keyboardType: KeyboardType.Text_,
                      controller: _remarkscontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    Button(
                        onpress: () {
                          if (_rented == Yesorno.no) {
                            detData.setEv(
                                _category.toString().split('.').last,
                                _wardnumbercontroller.text,
                                _wardnamecontroller.text,
                                _notcpcontroller.text,
                                _designationcontroller.text,
                                _phonecontroller.text,
                                _emailcontroller.text,
                                _rented.toString().split('.').last,
                                _yesorno.toString().split('.').last,
                                _remarkscontroller.text);
                          } else {
                            detData.setEvRented(
                                _category.toString().split('.').last,
                                _wardnumbercontroller.text,
                                _wardnamecontroller.text,
                                _notcpcontroller.text,
                                _designationcontroller.text,
                                _phonecontroller.text,
                                _emailcontroller.text,
                                _rented.toString().split('.').last,
                                _rentednamecontroller.text,
                                _rentedphonecontroller.text,
                                _rentedemailcontroller.text,
                                _notcp1controller.text,
                                _addresscontroller.text,
                                _yesorno.toString().split('.').last,
                                _remarkscontroller.text);
                          }
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            Navigator.pushNamed(context, InterestedScreen.id);
                          }
                        },
                        text: 'NEXT')
                  ]),
                ),
              ])),
        ));
  }
}
