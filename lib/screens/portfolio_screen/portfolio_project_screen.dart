import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_cubit.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_states.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_footor_screen.dart';
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

class PortfolioProjectScreen extends StatefulWidget {
  static const String routeName = 'portfolio_project_screen';

  @override
  _PortfolioProjectScreenState createState() => _PortfolioProjectScreenState();
}

class _PortfolioProjectScreenState extends State<PortfolioProjectScreen> {
  String url1,
      url2,
      url3,
      projectTitle1,
      projectTitle2,
      projectTitle3,
      projectBody1,
      projectBody2,
      projectBody3;
  Color background = Color(0xffd98025);
  Color titleColor = Color(0xffd98025);
  File image1, image2, image3;
  final picker = ImagePicker();

  Future getImage1() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        image1 = File(pickerFile.path);
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

  Future getImage2() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        image2 = File(pickerFile.path);
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

  Future getImage3() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        image3 = File(pickerFile.path);
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
                          'Portfolio Project',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Url1',
                        onChanged: (value) {
                          url1 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Url2',
                        onChanged: (value) {
                          url2 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Url3',
                        onChanged: (value) {
                          url3 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Project Title1',
                        onChanged: (value) {
                          projectTitle1 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Project Title2',
                        onChanged: (value) {
                          projectTitle2 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'project Title3',
                        onChanged: (value) {
                          projectTitle3 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Project Body1',
                        onChanged: (value) {
                          projectBody1 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Project Body2',
                        onChanged: (value) {
                          projectBody2 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Project Body3',
                        onChanged: (value) {
                          projectBody3 = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customImage(
                            name: 'Image1',
                            image: image1,
                            onTap: getImage1,
                          ),
                          customImage(
                            name: 'Image2',
                            image: image2,
                            onTap: getImage2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      customImage(
                        name: 'Image3',
                        onTap: getImage3,
                        image: image3,
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
                                  pickerColor: background,
                                  onChangeColor: (value) {
                                    setState(() {
                                      background = value;
                                    });
                                  });
                            },
                            color: background,
                            name: 'Background',
                          ),
                          customCircleColor(
                              name: 'TitleColor',
                              color: titleColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: titleColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        titleColor = value;
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
                          if (states is PortfolioSuccessProjectStates) {
                            if (states.portfolioProjectModals.portfolioResponse
                                    .status ==
                                "200") {
                              Navigator.popAndPushNamed(
                                  context, PortfolioFooterScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = PortfolioCubit.get(context);
                          if (states is! PortfolioLoadingProjectStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingProjectPortfolio(
                                    url1: url1,
                                    url2: url2,
                                    url3: url3,
                                    projectTitle1: projectTitle1,
                                    projectTitle2: projectTitle2,
                                    projectTitle3: projectTitle3,
                                    projectBody1: projectBody1,
                                    projectBody2: projectBody2,
                                    projectBody3: projectBody3,
                                    background: background.toString(),
                                    titleColor: titleColor.toString(),
                                    image1: image1,
                                    image2: image2,
                                    image3: image3,
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
