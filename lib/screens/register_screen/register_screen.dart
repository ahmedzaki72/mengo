import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/login_screen/login_screen.dart';
import 'package:mengo/screens/register_screen/cubit/register_cubit.dart';
import 'package:mengo/screens/register_screen/cubit/register_states.dart';
import 'package:mengo/widgets/check_direction.dart';
import 'package:mengo/widgets/custom_button_back.dart';
import 'package:mengo/widgets/custom_button_continue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_form_field.dart';
import 'package:toast/toast.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register_screen";
  final GlobalKey<FormState>  _formState = GlobalKey<FormState>();
  String email, password, username, phone;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: customContainerBackground(
          context: context,
          image: 'assets/images/bg.jpeg',
          child: SingleChildScrollView(
            child: BlocConsumer<RegisterCubit, RegisterStates>(
              listener: (context, states) {
                if(states is RegisterSuccessStates) {
                  if(states.registerModals.response.result.message.contains("Added Successfully")){
                     Navigator.pop(context);
                  }else{
                    Toast.show(
                      states.registerModals.response.result.message,
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  }
                }
              },
                builder: (context, states) {
                var cubit = RegisterCubit.get(context);
                  return  Form(
                    key: _formState,
                    child: Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: checkDirection(Alignment.topRight, Alignment.topLeft),
                            child: Padding(
                              padding: checkDirection( EdgeInsets.only(top: 8.h, right: 8.w),  EdgeInsets.only(top: 8.h, left: 8.w)),
                              child: customButtonBack(context: context),
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Image(
                            image: AssetImage('assets/images/Capture3.png'),
                            width: 200.w,
                            height: 100.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomFromField(
                            hintText: translator.translate('name'),
                            validation: (value) {
                              if(value.isEmpty || value.length < 3 ) {
                                return "Please Enter name greater than three character";
                              }
                            },
                            saved: (value){
                              username = value;
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomFromField(
                            hintText: translator.translate('phone'),
                            validation: (value) {
                              if(value.isEmpty || value.length < 11 ) {
                                return "Please Enter phone or greater than 11 number";
                              }
                            },
                            saved: (value){
                              phone = value;
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomFromField(
                            hintText: translator.translate('email_signIn'),
                            validation: (value) {
                              if(value.isEmpty || !value.contains('@')) {
                                return "Please Enter your email or correct email";
                              }
                            },
                            saved: (value){
                              email = value;
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomFromField(
                            hintText: translator.translate('password'),
                            security: true,
                            validation: (value) {
                              if(value.isEmpty || value.length < 4 ) {
                                return "Please Enter password or valid password ";
                              }
                            },
                            saved: (value){
                              password = value;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          if(states is! RegisterLoadingStates)...[
                            customButtonContinue(
                                context: context,
                                title: translator.translate('sign_up'),
                                function: () {
                                  if(_formState.currentState.validate()) {
                                    _formState.currentState.save();
                                    cubit.registration(username: username, email: email, password: password, phone: phone);
                                  }
                                }),
                          ]else ...[
                            Container(
                              height: 50.h,
                              child: Center(child: spinKit),
                            ),
                          ],
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have account ?"),
                              SizedBox(
                                width: 3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(LoginScreen.routeName);
                                },
                                child: Text(
                                  "SignIn",
                                  style: TextStyle(
                                    color: dark_red,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
            ),
          ),
        ),
      ),
    );
  }
}
