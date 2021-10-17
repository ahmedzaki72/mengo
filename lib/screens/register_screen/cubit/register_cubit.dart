import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/end_point.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/register_screen/cubit/register_states.dart';
import 'package:mengo/screens/register_screen/models/register_modals.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModals registerModals;

  void registration({
    @required username,
    @required email,
    @required password,
    @required phone,
  }) {
    emit(RegisterLoadingStates());
    var data = {
      "name" : "register",
      "param" : {
        'name': username,
        'email': email,
        'password': password,
        'phone': phone,
      }
    };
    DioHelper.postDat(
      url: '',
      data: data,
    ).then((value) {
      registerModals = RegisterModals.fromJson(value.data);
      emit(RegisterSuccessStates(registerModals: registerModals));
    }).catchError((error) {
      print("this is error $error");
      emit(
        RegisterErrorStates(
          error: error.toString(),
        ),
      );
    });
  }
}
