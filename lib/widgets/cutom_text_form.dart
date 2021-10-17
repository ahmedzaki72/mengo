import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool security;
  final TextInputType inputType;
  final Function(String) validation;
  final Function(String) saved;
  final int maxLine;
  final Widget prefix;
  final Widget suffix;
  final Function(String) onChanged;

  CustomTextFormField({
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
      width: 230.w,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          contentPadding: EdgeInsets.only(
            left: 5.w,
          ),
          hintText: hintText,
          // filled: true,
          // fillColor: input_color,
          hintStyle: TextStyle(
            color: input_border_color,
            fontSize: 15.sp,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: input_border_color, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: input_border_color, width: 1)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: input_border_color, width: 1)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: input_border_color, width: 1)),
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
