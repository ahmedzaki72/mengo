import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_cubit.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_states.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_skill_screen.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';

class PortfolioExperienceScreen extends StatefulWidget {
  static const String routeName = 'portfolio_experience_screen';

  @override
  _PortfolioExperienceScreenState createState() =>
      _PortfolioExperienceScreenState();
}

class _PortfolioExperienceScreenState extends State<PortfolioExperienceScreen> {
  String title1, title2, title3, title4, body1, body2, body3, body4;
  Color experience_background = Color(0xffd98025);
  Color experience_title_color = Color(0xffd98025);
  Color title_color = Color(0xffd98025);
  Color text_color = Color(0xffd98025);
  Color icons_color = Color(0xffd98025);

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
                          'Portfolio Experience',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'title1',
                        onChanged: (value) {
                          title1 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'title2',
                        onChanged: (value) {
                          title2 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'title3',
                        onChanged: (value) {
                          title3 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'title4',
                        onChanged: (value) {
                          title4 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'body1',
                        onChanged: (value) {
                          body1 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'body2',
                        onChanged: (value) {
                          body2 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'body3',
                        onChanged: (value) {
                          body3 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'body4',
                        onChanged: (value) {
                          body4 = value;
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
                                    pickerColor: experience_background,
                                    onChangeColor: (value) {
                                      setState(() {
                                        experience_background = value;
                                      });
                                    });
                              },
                              color: experience_background,
                              name: 'Background'),
                          customCircleColor(
                              name: 'TitleColors',
                              color: experience_title_color,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: experience_title_color,
                                    onChangeColor: (value) {
                                      setState(() {
                                        experience_title_color = value;
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
                                  pickerColor: title_color,
                                  onChangeColor: (value) {
                                    setState(() {
                                      title_color = value;
                                    });
                                  });
                            },
                            color: title_color,
                            name: 'TitleColor',
                          ),
                          customCircleColor(
                              name: 'TextColor',
                              color: text_color,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: title_color,
                                    onChangeColor: (value) {
                                      setState(() {
                                        text_color = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      customCircleColor(
                        name: 'IconsColor',
                        color: icons_color,
                        onTap: (){
                          showAlertDialog(
                              context: context,
                              pickerColor: icons_color,
                              onChangeColor: (value) {
                                setState(() {
                                  icons_color = value;
                                });
                              });
                        }
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<PortfolioCubit, PortfolioStates>(
                        listener: (context, states) {
                          if (states is PortfolioSuccessExperienceStates) {
                            if (states.portfolioExperienceModals
                                    .portfolioResponse.status ==
                                "200") {
                              Navigator.popAndPushNamed(
                                  context, PortfolioSkillScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = PortfolioCubit.get(context);
                          if (states is! PortfolioLoadingExperienceStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingExperiencePortfolio(
                                    title1: title1,
                                    title2: title2,
                                    title3: title3,
                                    title4: title4,
                                    titleColor: title_color.toString(),
                                    textColor: text_color.toString(),
                                    body1: body1,
                                    body2: body2,
                                    body3: body3,
                                    body4: body4,
                                    experienceBackground: experience_background.toString(),
                                    experienceTitleColor: experience_title_color.toString(),
                                    iconColor: icons_color.toString(),
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
