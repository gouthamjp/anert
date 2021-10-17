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
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
  final _othersspecifycontroller = TextEditingController();

  Category? _category = Category.residential;
  Yesorno? _yesorno = Yesorno.yes;
  Yesorno? _rented = Yesorno.no;
  //final _buildignamenode = FocusNode();
  // final _notcpnode = FocusNode();
  String data0 = '';
  String data1 = '';
    File? _image1;
    File? _image2;
    File? _image3;
    final String imageurl = 'assets/images/download.png';
  void test() {
    _formKey.currentState!.save();
    data0 = _buildignamecontroller.text;
    data1 = _notcpcontroller.text;
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
                      requiredornot: true,
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
                        requiredornot: true,
                        onSavedField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    YesOpenFormFieldBox(
                        hintText: 'Enter email',
                        labelText: 'Email of Owner',
                        keyboardType: KeyboardType1.Text_,
                        controller: _rentedemailcontroller,
                        didEndTextEdit: () {},
                        requiredornot: true,
                        onSavedField: (value) {},
                        yesorno: _rented == Yesorno.yes ? true : false),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Name of the Contact Person',
                      hintText: 'Enter Name',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _notcp1controller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Phone Number',
                      hintText: 'Enter Number Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Number_,
                      controller: _phone1controller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Email Address',
                      hintText: 'Enter Email Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _email1controller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                    FormFieldBox(
                      onSavedField: (value) {},
                      labelText: 'Address',
                      hintText: 'Enter Address Here',
                      requiredornot: true,
                      keyboardType: KeyboardType.Text_,
                      controller: _addresscontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
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
                      labelText: 'Remarks',
                      hintText: 'Enter Remarks Here',
                      requiredornot: false,
                      keyboardType: KeyboardType.Text_,
                      controller: _remarkscontroller,
                      // focusNode: _notcpnode,
                      didEndTextEdit: () {},
                    ),
                     Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final image1 = await ImagePicker()
                                  .getImage(source: ImageSource.camera);

                              setState(() {
                                _image1 =
                                    image1 == null ? null : File(image1.path);
                              });
                            },
                            child: Container(margin: EdgeInsets.all(2),
                              child: _image1 == null
                                  ? Image.asset('$imageurl')
                                  : Image.file(_image1!),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async{
                              print(_image2);
                              final image2 = await ImagePicker()
                                  .getImage(source: ImageSource.camera);

                              setState(() {
                                _image2 =
                                    image2 == null ? null : File(image2.path);
                                    
                                    print(_image2);
                              });
                            
                            },
                            child: Container(margin: EdgeInsets.all(2),
                              child: _image2 == null? Image.asset('$imageurl'): Image.file(_image2!),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async{
                              final image3 = await ImagePicker()
                                  .getImage(source: ImageSource.camera);

                              setState(() {
                                _image3 =
                                    image3 == null ? null : File(image3.path);
                              });
                            },
                            child: Container(margin: EdgeInsets.all(2),
                              child: _image3 == null
                                  ? Image.asset('$imageurl')
                                  : Image.file(_image3!),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Button(
                        onpress: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            Navigator.pushNamed(context, InterestedScreen.id);
                          }
                          if (_rented == Yesorno.no) {
                            detData.setThree(
                                user!.uid,
                                _buildignamecontroller.text,
                                _category.toString().split('.').last,
                                _notcpcontroller.text,
                                _designationcontroller.text,
                                _phonecontroller.text,
                                _emailcontroller.text,
                                _rented.toString().split('.').last,
                                _notcp1controller.text,
                                _phone1controller.text,
                                _email1controller.text,
                                _addresscontroller.text,
                                _yesorno.toString().split('.').last,
                                _remarkscontroller.text);
                          } else {
                            detData.setThreeRented(
                                user!.uid,
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
                                _notcp1controller.text,
                                _phone1controller.text,
                                _email1controller.text,
                                _addresscontroller.text,
                                _yesorno.toString().split('.').last,
                                _remarkscontroller.text);
                          }
                        },
                        text: 'NEXT')
                  ]),
                ),
              ])),
        ));
  }
}
