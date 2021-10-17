import 'package:mengo/screens/project_screen/%20modals/project_modals.dart';

abstract class ProjectStates {}

class ProjectInitialStates extends ProjectStates {}

class ProjectLoadingStates extends ProjectStates {}

class ProjectSuccessStates extends ProjectStates {
  ProjectModals projectModals;
  ProjectSuccessStates({this.projectModals});
}

class ProjectErrorStates extends ProjectStates {
  final String error;
  ProjectErrorStates({this.error});
}
