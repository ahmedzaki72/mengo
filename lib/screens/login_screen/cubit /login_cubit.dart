import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/login_screen/cubit%20/login_states.dart';
import 'package:mengo/screens/login_screen/modals/loginModals.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModals loginModals;

  void login({
    @required email,
    @required password,
  }) {
    var data = {
      "name": "login",
      "param": {
        "email": email,
        "password": password,
      },
    };
    emit(LoginLoadingStates());
    DioHelper.postDat(url: "", data: data).then((value) {
      loginModals = LoginModals.fromJson(value.data);
      emit(LoginSuccessStates(loginModals: loginModals));
    }).catchError((error) {
      print('this is error $error');
      emit(
        LoginErrorStates(
          error: error.toString(),
        ),
      );
    });
  }
}
