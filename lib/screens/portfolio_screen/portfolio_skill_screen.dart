import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_cubit.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_states.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_project_screen.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';

class PortfolioSkillScreen extends StatefulWidget {
  static const String routeName = 'portfolio_skill_screen';

  @override
  _PortfolioSkillScreenState createState() => _PortfolioSkillScreenState();
}

class _PortfolioSkillScreenState extends State<PortfolioSkillScreen> {
  String skillTitle, title1, title2, title3, icon1, icon2, icon3;
  Color skillTitleColor = Color(0xffd98025);
  Color iconColor = Color(0xffd98025);
  Color textColor = Color(0xffd98025);

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
                          'Portfolio Skill',
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
                        hintText: 'Icon1',
                        onChanged: (value) {
                          icon1 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'icon2',
                        onChanged: (value) {
                          icon2 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'icon3',
                        onChanged: (value) {
                          icon3 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'SkillTitle',
                        onChanged: (value) {
                          skillTitle = value;
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
                                    pickerColor: skillTitleColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        skillTitleColor = value;
                                      });
                                    });
                              },
                              color: skillTitleColor,
                              name: 'TitleColors'),
                          customCircleColor(
                              name: 'IconColor',
                              color: iconColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: iconColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        iconColor = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      customCircleColor(
                        name: "TextColor",
                        color: textColor,
                        onTap: (){
                          showAlertDialog(
                              context: context,
                              pickerColor: textColor,
                              onChangeColor: (value) {
                                setState(() {
                                  textColor = value;
                                });
                              });
                        }
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<PortfolioCubit, PortfolioStates>(
                        listener: (context, states) {
                          if (states is PortfolioSuccessSkillsStates) {
                            if (states.portfolioSkillsModals.portfolioResponse
                                    .status ==
                                "200") {
                              Navigator.popAndPushNamed(
                                  context, PortfolioProjectScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = PortfolioCubit.get(context);
                          if(states is! PortfolioLoadingSkillsStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingSkillsPortfolio(
                                    skillsTitleColor: skillTitleColor.toString(),
                                    skillTitle: skillTitle,
                                    title1: title1,
                                    title2: title2,
                                    title3: title3,
                                    iconColor: iconColor.toString(),
                                    icon1: icon1,
                                    icon2: icon1,
                                    icon3: icon3,
                                    textColor: textColor.toString(),
                                  );
                                });
                          }else {
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
