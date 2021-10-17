import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_cubit.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_states.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_about_screen.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_images_upload.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';
import 'package:toast/toast.dart';

class PortfolioStartScreen extends StatefulWidget {
  static const String routeName = "Portfolio_screen";

  @override
  _PortfolioStartScreenState createState() => _PortfolioStartScreenState();
}

class _PortfolioStartScreenState extends State<PortfolioStartScreen> {
  String appName;
  String startTitle;
  String startSubtitle;
  String startBody;
  Color navBarColors = Color(0xffd98025);
  Color startTitleColors = Color(0xffd98025);
  Color startSubTitleColors = Color(0xffd98025);
  Color startBodyColors = Color(0xffd98025);
  File startImage;
  final picker = ImagePicker();

  Future getImages() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        startImage = File(pickerFile.path);
      } else {
        Toast.show(
          'no_images_select',
          context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(navBarColors);
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
                          'Portfolio Start',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'App Name',
                        onChanged: (value) {
                          appName = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Start Title',
                        onChanged: (value) {
                          startTitle = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Start Subtitle',
                        onChanged: (value) {
                          startSubtitle = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Start Body',
                        onChanged: (value) {
                          startBody = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      customImage(
                        name: 'ImageStart',
                        image: startImage,
                        onTap: getImages,
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
                                    pickerColor: startTitleColors,
                                    onChangeColor: (value) {
                                      setState(() {
                                        startTitleColors = value;
                                      });
                                    });
                              },
                              color: startTitleColors,
                              name: 'TitleColors'),
                          customCircleColor(
                              name: 'NavBarColors',
                              color: navBarColors,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: navBarColors,
                                    onChangeColor: (value) {
                                      setState(() {
                                        navBarColors = value;
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
                                  pickerColor: startSubTitleColors,
                                  onChangeColor: (value) {
                                    setState(() {
                                      startSubTitleColors = value;
                                    });
                                  });
                            },
                            color: startSubTitleColors,
                            name: 'SubTitleColors',
                          ),
                          customCircleColor(
                              name: 'BodyColors',
                              color: startBodyColors,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: startBodyColors,
                                    onChangeColor: (value) {
                                      setState(() {
                                        startBodyColors = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<PortfolioCubit, PortfolioStates>(
                        listener: (context, states) {
                          if (states is PortfolioSuccessStates) {
                            if (states
                                    .portfolioModal.portfolioResponse.status ==
                                "200") {
                              Navigator.popAndPushNamed(
                                  context, PortfolioAboutScreen.routName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = PortfolioCubit.get(context);
                          if (states is! PortfolioLoadingStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingStartPortfolio(
                                    appName: appName,
                                    startTitle: startTitle,
                                    starSubtitle: startSubtitle,
                                    body: startBody,
                                    image: startImage,
                                    navBarColor: navBarColors.toString(),
                                    startSubtitleColor:
                                        startSubTitleColors.toString(),
                                    startBodyColor: startBodyColors.toString(),
                                    titleColor: startTitleColors.toString(),
                                  );
                                });
                          } else {
                            return spinKit;
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.h,
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
