import 'package:mengo/screens/profile_screen/profile_modals/profile_modals.dart';

abstract class ProfileStates {}

class ProfileInitialStates extends ProfileStates {}

class ProfileLoadingStates extends ProfileStates {}

class ProfileSuccessStates extends ProfileStates {
  ProfileModals profileModals;
  ProfileSuccessStates({this.profileModals});
}

class ProfileErrorStates extends ProfileStates {
  final String error;
  ProfileErrorStates({this.error});
}

class ProfileAddLoadingStates extends ProfileStates {}

class ProfileAddSuccessStates extends ProfileStates {}

class ProfileAddErrorStates extends ProfileStates {
  final String error;
  ProfileAddErrorStates({this.error});
}

class ProfileChangeLoadingStates extends ProfileStates {}

class ProfileChangeSuccessStates extends ProfileStates {
  final ProfileChangeModals profileChange;
  ProfileChangeSuccessStates({this.profileChange});
}

class ProfileChangeErrorStates extends ProfileStates {
  final String error;
  ProfileChangeErrorStates({this.error});
}

class UploadImageStates extends ProfileStates {}
