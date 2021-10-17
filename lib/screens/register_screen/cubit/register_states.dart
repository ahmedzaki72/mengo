import 'package:mengo/screens/register_screen/models/register_modals.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {
  final RegisterModals registerModals;
  RegisterSuccessStates({this.registerModals});
}

class RegisterErrorStates extends RegisterStates {
  final String error;
  RegisterErrorStates({this.error});
}
