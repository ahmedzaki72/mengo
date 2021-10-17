import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/commericial_screen/commericial_footer_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_latest_screen.dart';
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

class CommericialProjectScreen extends StatefulWidget {
  static const String routeName = "CommericialProjectScreen";

  @override
  _CommericialProjectScreenState createState() =>
      _CommericialProjectScreenState();
}

class _CommericialProjectScreenState extends State<CommericialProjectScreen> {
  Color titleColor = Color(0xffd98025);
  Color textColor = Color(0xffd98025);
  String text;
  Color moreButtonColor = Color(0xffd98025);
  Color moreButtonTextColor = Color(0xffd98025);
  Color backgroundColor = Color(0xffd98025);

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
                          'Commercial Project',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
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
                                    pickerColor: moreButtonColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        moreButtonColor = value;
                                      });
                                    });
                              },
                              color: moreButtonColor,
                              name: 'MoreButtonColor'),
                          customCircleColor(
                              name: 'MoreButtonTextColor',
                              color: moreButtonTextColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: moreButtonTextColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        moreButtonTextColor = value;
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
                          if (states is CommercialSuccessProjectStates) {
                            if (states.commercialProject.commercialResponse
                                    .status ==
                                '200') {
                              Navigator.pushNamed(
                                  context, CommericialLatestScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = CommercialCubit.get(context);
                          if (states is! CommercialLoadingProjectStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingCommercialProject(
                                    backgroundColor: backgroundColor.toString(),
                                    titleColor: titleColor.toString(),
                                    textColor: titleColor.toString(),
                                    text: text,
                                    moreButtonTextColor:
                                        moreButtonTextColor.toString(),
                                    moreButtonColor: moreButtonColor.toString(),
                                  );
                                });
                          } else {
                            return spinKit;
                          }
                        },
                      ),
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
