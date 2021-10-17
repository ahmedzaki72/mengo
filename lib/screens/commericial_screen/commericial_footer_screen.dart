import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/commericial_screen/commericial_single_project_screen.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_cubit.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_states.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';

class CommericialFooterScreen extends StatefulWidget {
  static const String routeName = "CommericialFooterScreen";

  @override
  _CommericialFooterScreenState createState() =>
      _CommericialFooterScreenState();
}

class _CommericialFooterScreenState extends State<CommericialFooterScreen> {
  String map_link, title, text, address, email;
  Color backgroundColor = Color(0xffd98025);
  Color titleColor = Color(0xffd98025);
  Color textColor = Color(0xffd98025);
  Color aboutColor = Color(0xffd98025);
  Color addressColor = Color(0xffd98025);
  Color emailColor = Color(0xffd98025);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customContainerBackground(
        context: context,
        image: 'assets/images/bg.jpeg',
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              customHeader(context: context),
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 200.w,
                height: 100.w,
              ),
              SizedBox(
                height: 40.h,
              ),
              customContainerShadow(
                context: context,
                width: 330.w,
                height: 500.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          'Commercial Footer',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'MapLink',
                        onChanged: (value) {
                          map_link = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Title',
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Text',
                        onChanged: (value) {
                          text = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Address',
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Email',
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customCircleColor(
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: titleColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        titleColor = value;
                                      });
                                    });
                              },
                              color: titleColor,
                              name: 'TitleColor'),
                          customCircleColor(
                              name: 'TextColor',
                              color: textColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: textColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        textColor = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customCircleColor(
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: backgroundColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        backgroundColor = value;
                                      });
                                    });
                              },
                              color: backgroundColor,
                              name: 'BackgroundColor'),
                          customCircleColor(
                              name: 'AboutColor',
                              color: aboutColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: aboutColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        aboutColor = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customCircleColor(
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: addressColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        addressColor = value;
                                      });
                                    });
                              },
                              color: addressColor,
                              name: 'AddressColor'),
                          customCircleColor(
                              name: 'EmailColor',
                              color: emailColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: emailColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        emailColor = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<CommercialCubit, CommercialStates>(
                        listener: (context, states) {
                          if (states is CommercialFooterSuccessStates) {
                            if (states.commercialFooter.commercialResponse
                                    .status ==
                                '200') {
                              Navigator.pushNamed(context,
                                  CommericialSingleProjectScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = CommercialCubit.get(context);
                          if (states is! CommercialFooterLoadingStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingCommercialFooter(
                                    mapLink: map_link,
                                    backgroundColor: backgroundColor.toString(),
                                    titleColor: titleColor.toString(),
                                    textColor: textColor.toString(),
                                    text: text,
                                    title: title,
                                    addressColor: addressColor.toString(),
                                    address: address,
                                    aboutColor: aboutColor.toString(),
                                    emailColor: emailColor.toString(),
                                    email: email,
                                  );
                                });
                          } else {
                            return spinKit;
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        )),
      ),
    );
  }
}
