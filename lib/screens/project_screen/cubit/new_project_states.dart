import 'package:mengo/screens/project_screen/%20modals/newProject_modals.dart';

abstract class NewProjectStates {}

class NewProjectInitialStates extends NewProjectStates {}

class NewProjectLoadingStates extends NewProjectStates {}

class NewProjectSuccessStates extends NewProjectStates {
  final NewProjectModals newProjectModals;
  NewProjectSuccessStates({this.newProjectModals});
}

class NewProjectErrorStates extends NewProjectStates {
  final String error;
  NewProjectErrorStates({this.error});
}
