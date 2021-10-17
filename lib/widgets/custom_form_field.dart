import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

class CustomFromField extends StatelessWidget {
  final String hintText;
  final bool security;
  final TextInputType inputType;
  final Function(String) validation;
  final Function(String) saved;
  final int maxLine;
  final Widget prefix;
  final Widget suffix;
  final Function(String) onChanged;

  CustomFromField({
    this.hintText,
    this.inputType = TextInputType.text,
    this.saved,
    this.validation,
    this.security = false,
    this.maxLine = 1,
    this.prefix,
    this.suffix,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(color: dark_red),
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            color: dark_red,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: dark_red, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color:dark_red, width: 1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: dark_red, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: dark_red, width: 1)),
        ),
        validator: validation,
        onSaved: saved,
        obscureText: security,
        maxLines: maxLine,
        keyboardType: inputType,
      ),
    );
  }
}
