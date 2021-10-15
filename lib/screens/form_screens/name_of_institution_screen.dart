import 'package:anert/constants.dart';
import 'package:anert/screens/form_screens/inspection_site.dart';
import 'package:anert/screens/option_selection.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/button.dart';
import 'package:anert/utils/FormFieldBox.dart';
import 'package:anert/utils/radiobox.dart';
import 'package:anert/utils/button.dart';

enum Yesorno { yes, no }

class NameOfInstitution extends StatefulWidget {
  const NameOfInstitution({Key? key}) : super(key: key);

  @override
  _NameOfInstitutionState createState() => _NameOfInstitutionState();
}

class _NameOfInstitutionState extends State<NameOfInstitution> {
  final _formKey = GlobalKey<FormState>();
  final _buildignamecontroller = TextEditingController();
  Yesorno? _yesorno = Yesorno.yes;
  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: mquery.height * 0.15,
                child: FormFieldBox(
                  onSavedField: (value) {},
                  labelText: 'Name of Building',
                  hintText: 'Enter name of building',
                  keyboardType: KeyboardType.Text_,
                  controller: _buildignamecontroller,
                  requiredornot: true,
                  //focusNode: _buildignamenode,
                  didEndTextEdit: () {},
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
                    ],
                  )),
              Button(
                  onpress: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>OptionSelection()));
                  },
                  text: 'NEXT')
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
