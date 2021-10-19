import 'package:flutter/material.dart';
import '/constants.dart';

enum KeyboardType1 { Number_, Text_ }

extension KeyboardTypeExtension on KeyboardType1 {
  TextInputType get keyboardType {
    switch (this) {
      case KeyboardType1.Number_:
        return TextInputType.number;
      case KeyboardType1.Text_:
        return TextInputType.text;
    }
  }
}

class YesOpenFormFieldBox extends StatefulWidget {
  final String hintText;
  final String labelText;
  final KeyboardType1 keyboardType;
  final TextEditingController controller;
  final Function didEndTextEdit;
  final double height;
  final TextInputAction textInputAction;
  final bool requiredornot;
  final Function(String?) onSavedField;
  final Function(String?) onSubmitingField;
  final Function(String?) onChanged;
  
  final bool yesorno;
  //final FocusNode focusNode;

  YesOpenFormFieldBox(
      {required this.hintText,
      required this.labelText,
      required this.keyboardType,
      required this.controller,
      required this.didEndTextEdit,
      required this.requiredornot,
      required this.onSavedField,
      required this.yesorno,
      required this.onSubmitingField,
      required this.onChanged,
      
      // required this.focusNode,
      this.height = 80,
      this.textInputAction = TextInputAction.next});

  @override
  _YesOpenFormFieldBoxState createState() => _YesOpenFormFieldBoxState();

  void setState(Null Function() param0) {}
}

class _YesOpenFormFieldBoxState extends State<YesOpenFormFieldBox> {
  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
    if(widget.yesorno==false){
      return Container();
    }
    else return Container(
      //height: widget.height,
      child: Container(
        margin: EdgeInsets.only(left: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.labelText,
                    textAlign: TextAlign.left, style: GreenTvmTheme.fieldHeading),
                Text(
                  widget.requiredornot ? '*' : '',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            SizedBox(
              height: 0.005 * mquery.height,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.disabled,
              onTap: () {},
              cursorColor: GreenTvmTheme.primaryBlue,
              textAlign: TextAlign.left,
              keyboardType: widget.keyboardType.keyboardType,
              textInputAction: widget.textInputAction,
              autocorrect: false,
              autofillHints: null,
              enableSuggestions: false,
              maxLines: 1,
              expands: false,
              onSaved: ((String? Value) {}),
              onFieldSubmitted: (v) {
                //  FocusScope.of(context).nextFocus();
              },
              onChanged: widget.onChanged ,

              validator: (value) {
                String phone = r'(^[0-9]{10}$)';
                RegExp phoneregExp = new RegExp(phone);
                String emailValid =
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                RegExp emailregExp = new RegExp(emailValid);
                if(widget.requiredornot){
                if (value == null || value.isEmpty) {
                  return 'This field is mandatory';
                } else if (!phoneregExp.hasMatch(value) &&
                    (widget.labelText == "Phone Number")) {
                  return 'Please enter a valid mobile number';
                } else if (!emailregExp.hasMatch(value) &&
                    (widget.labelText == "Email address")) {
                  return 'Please enter a valid email id';
                }}

                return null;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: GreenTvmTheme.primaryBlue,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide()),
                filled: true,
                contentPadding: const EdgeInsets.all(12.0),
                isDense: false,
                labelStyle: GreenTvmTheme.fieldHeading,
                hintText: widget.hintText,
                hintStyle: GreenTvmTheme.hintTextStyle,
              ),
              controller: widget.controller,
            ),
            SizedBox(
              height: 0.03 * mquery.height,
            ),
          ],
        ),
      ),
    );
  }
}