import 'package:flutter/material.dart';
import '/constants.dart';

enum KeyboardType { ID, Password }

extension KeyboardTypeExtension on KeyboardType {
  TextInputType get keyboardType {
    switch (this) {
      case KeyboardType.ID:
        return TextInputType.name;
      case KeyboardType.Password:
        return TextInputType.text;
    }
  }

  TextCapitalization get textCapitalization {
    return (this == KeyboardType.ID)
        ? TextCapitalization.words
        : TextCapitalization.none;
  }

  RegExp get regex {
    switch (this) {
      case KeyboardType.ID:
        return RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
      case KeyboardType.Password:
        return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{6,}$');
    }
  }
}

class AuthenticationTextField extends StatefulWidget {
  final String hintText;
  final bool isObscure;
  final KeyboardType keyboardType;
  final TextEditingController controller;
  final Function didEndTextEdit;
  final double height;
  final TextInputAction textInputAction;

  AuthenticationTextField(
      {required this.hintText,
      required this.isObscure,
      required this.keyboardType,
      required this.controller,
      required this.didEndTextEdit,
      this.height = 50,
      this.textInputAction = TextInputAction.next});

  @override
  _AuthenticationTextFieldState createState() =>
      _AuthenticationTextFieldState();
}

class _AuthenticationTextFieldState extends State<AuthenticationTextField> {
  bool _isObscure = true;

  void _togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Widget _buildTextField() {
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
              textCapitalization: widget.keyboardType.textCapitalization,
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
                  hintStyle: GreenTvmTheme.hintTextStyle),
              controller: widget.controller,
            )),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      height: widget.height,
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        elevation: 4,
        child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Stack(
              children: [
                TextField(
                  style: GreenTvmTheme.hintTextStyle,
                  cursorColor: GreenTvmTheme.primaryBlue,
                  textAlign: TextAlign.left,
                  obscureText: _isObscure,
                  keyboardType: widget.keyboardType.keyboardType,
                  textInputAction: widget.textInputAction,
                  autocorrect: false,
                  autofillHints: null,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    hintStyle: GreenTvmTheme.hintTextStyle,
                  ),
                  controller: widget.controller,
                  onSubmitted: (_) => null,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: _togglePasswordView,
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isObscure) {
      return _buildPasswordTextField();
    } else {
      return _buildTextField();
    }
  }
}
