import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_cubit.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_states.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_experience_screen.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:mengo/widgets/custom_images_upload.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class PortfolioAboutScreen extends StatefulWidget {
  static const String routName = "portfolio_about_screen";

  @override
  _PortfolioAboutScreenState createState() => _PortfolioAboutScreenState();
}

class _PortfolioAboutScreenState extends State<PortfolioAboutScreen> {
  String subtitle, body, portfolio_url;
  Color about_color =Color(0xffd98025);
  Color title_color = Color(0xffd98025);
  Color subtitle_color =Color(0xffd98025);
  Color body_color =Color(0xffd98025);
  Color portfolio_about_color = Color(0xffd98025);
  Color portfolio_text_color = Color(0xffd98025);

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
                          'Portfolio About',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Subtitle',
                        onChanged: (value) {
                          subtitle = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Body',
                        onChanged: (value) {
                          body = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Portfolio Url',
                        onChanged: (value) {
                          portfolio_url = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      customImage(image: startImage, onTap: getImages, name: 'AboutImage'),
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
                                    pickerColor: about_color,
                                    onChangeColor: (value) {
                                      setState(() {
                                        about_color = value;
                                      });
                                    });
                              },
                              color: about_color,
                              name: 'AboutColor'),
                          customCircleColor(
                              name: 'TitleColor',
                              color: title_color,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: title_color,
                                    onChangeColor: (value) {
                                      setState(() {
                                        title_color = value;
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
                                  pickerColor: subtitle_color,
                                  onChangeColor: (value) {
                                    setState(() {
                                      subtitle_color = value;
                                    });
                                  });
                            },
                            color: subtitle_color,
                            name: 'SubTitleColors',
                          ),
                          customCircleColor(
                              name: 'BodyColors',
                              color: body_color,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: body_color,
                                    onChangeColor: (value) {
                                      setState(() {
                                        body_color = value;
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
                                  pickerColor: portfolio_about_color,
                                  onChangeColor: (value) {
                                    setState(() {
                                      portfolio_about_color = value;
                                    });
                                  });
                            },
                            color: portfolio_about_color,
                            name: 'PortfolioAbout',
                          ),
                          customCircleColor(
                              name: 'PortfolioText',
                              color: portfolio_text_color,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: portfolio_text_color,
                                    onChangeColor: (value) {
                                      setState(() {
                                        portfolio_text_color = value;
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
                          if (states is PortfolioSuccessAboutStates) {
                            if (states.portfolioAboutModals.portfolioResponse
                                    .status ==
                                "200") {
                              Navigator.popAndPushNamed(
                                  context, PortfolioExperienceScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = PortfolioCubit.get(context);
                          if(states is! PortfolioLoadingAboutStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingAboutPortfolio(
                                    subtitle: subtitle,
                                    body: body,
                                    bodyColors: body_color.toString(),
                                    portfolioButtonColor:
                                    portfolio_text_color.toString(),
                                    portfolioTextColor:
                                    portfolio_text_color.toString(),
                                    portfolioUrl: portfolio_url,
                                    image: startImage,
                                    titleColor: title_color.toString(),
                                    subtitleColors: subtitle_color.toString(),
                                    aboutColor: about_color.toString(),
                                  );
                                });
                          }else {
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
              ),
            ],
          ),
        )),
      ),
    );
  }
}
