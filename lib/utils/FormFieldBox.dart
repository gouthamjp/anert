import 'package:flutter/material.dart';
import '/constants.dart';

enum KeyboardType {
  Number_,
  Text_
}

extension KeyboardTypeExtension on KeyboardType {
  TextInputType get keyboardType {
    switch(this) {
      case KeyboardType.Number_:
        return TextInputType.number;
      case KeyboardType.Text_:
        return TextInputType.text;
    }
  }

}

class FormFieldBox extends StatefulWidget {
  
  final String hintText;
  final KeyboardType keyboardType;
  final TextEditingController controller;
  final Function didEndTextEdit;
  final double height;
  final TextInputAction textInputAction;

  FormFieldBox({
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.didEndTextEdit,
    this.height = 50,
    this.textInputAction = TextInputAction.next
  });



  @override
  _FormFieldBoxState createState() => _FormFieldBoxState();
}

class _FormFieldBoxState extends State<FormFieldBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        elevation: 4,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextFormField(
            style: GreenTvmTheme.hintTextStyle,
            cursorColor: GreenTvmTheme.primaryBlue,
            textAlign: TextAlign.left,
            keyboardType: widget.keyboardType.keyboardType,
            textInputAction: widget.textInputAction,
            autocorrect: false,
            autofillHints: null,
            enableSuggestions: false,
            maxLines: 1,
            expands: false,
            decoration: InputDecoration(
              
              fillColor: Colors.white,
              
              filled: true,
              contentPadding: const EdgeInsets.all(0.0),
              isDense: true,
              hintText: widget.hintText,
              border: InputBorder.none,
              hintStyle: GreenTvmTheme.hintTextStyle
            ),
            controller: widget.controller,
          )
        ),
      ),
    );
  }
}
