import 'package:mengo/screens/login_screen/modals/loginModals.dart';

abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  final LoginModals loginModals;
  LoginSuccessStates({this.loginModals});
}

class LoginErrorStates extends LoginStates {
  final String error;
  LoginErrorStates({this.error});
}
