import 'package:mengo/screens/subscribe_screen/modals/package_add_modals.dart';

abstract class PackageStates {}

class PackageInitialStates extends PackageStates {}

class PackageLoadingStates extends PackageStates {}

class PackageSuccessStates extends PackageStates {}

class PackageErrorStates extends PackageStates {
  final String error;
  PackageErrorStates({this.error});
}

class PackageAddingLoadingStates extends PackageStates {}

class PackageAddingSuccessStates extends PackageStates {
  final PackageAddModals packageAddModals;
  PackageAddingSuccessStates({this.packageAddModals});
}

class PackageAddingErrorStates extends PackageStates {
  final String error;
  PackageAddingErrorStates({this.error});
}
