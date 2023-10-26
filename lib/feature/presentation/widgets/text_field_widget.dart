import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool digitsOnly;
  final bool isEmail;
  final double? width;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.icon,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
    this.digitsOnly = false,
    this.width,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  var unHidePassword = false;

  @override
  Widget build(BuildContext context) {
    final widgetWidth = min<double>(MediaQuery.of(context).size.width * 0.8, 400);
    return SizedBox(
      width: widget.width ?? widgetWidth,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? !unHidePassword : false,
        inputFormatters: widget.digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
        keyboardType: widget.isEmail
            ? TextInputType.emailAddress
            : widget.digitsOnly
            ? TextInputType.number
            : TextInputType.text,
        decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(
              widget.icon,
              color: Colors.black,
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                onLongPressStart: (_) {
                  setState(() {
                    unHidePassword = true;
                  });
                },
                onLongPressEnd: (_) {
                  setState(() {
                    unHidePassword = false;
                  });
                },
                child: const Icon(FontAwesome.eye_off, color: Color(0xFF6E6A6A)))
                : null,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            contentPadding: const EdgeInsets.all(20),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xFF6E6A6A), fontSize: 14)),
      ),
    );
  }
}
