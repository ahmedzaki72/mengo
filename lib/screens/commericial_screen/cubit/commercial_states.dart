import 'package:mengo/screens/commericial_screen/modals/commercial_modals.dart';

abstract class CommercialStates {}

class CommercialStartInitialStates extends CommercialStates {}

class CommercialStartLoadingStates extends CommercialStates {}

class CommercialStartSuccessStates extends CommercialStates {
  CommercialModal commercialModal;
  CommercialStartSuccessStates({this.commercialModal});
}

class CommercialStartErrorStates extends CommercialStates {
  final String error;
  CommercialStartErrorStates({this.error});
}

class CommercialLoadingAboutStates extends CommercialStates {}

class CommercialSuccessAboutStates extends CommercialStates {
  CommercialModal commercialAboutModals;
  CommercialSuccessAboutStates({this.commercialAboutModals});
}

class CommercialErrorAboutStates extends CommercialStates {
  final String error;

  CommercialErrorAboutStates({this.error});
}

class CommercialServicesLoadingStates extends CommercialStates {}

class CommercialServicesSuccessStates extends CommercialStates {
  CommercialModal commercialServices;
  CommercialServicesSuccessStates({this.commercialServices});
}

class CommercialServicesErrorStates extends CommercialStates {
  final String error;

  CommercialServicesErrorStates({this.error});
}

class CommercialLoadingProjectStates extends CommercialStates {}

class CommercialSuccessProjectStates extends CommercialStates {
  CommercialModal commercialProject;
  CommercialSuccessProjectStates({this.commercialProject});
}

class CommercialErrorProjectStates extends CommercialStates {
  final String error;

  CommercialErrorProjectStates({this.error});
}

class CommercialLatestLoadingStates extends CommercialStates {}

class CommercialLatestSuccessStates extends CommercialStates {
  CommercialModal commercialLatest;
  CommercialLatestSuccessStates({this.commercialLatest});
}

class CommercialLatestErrorStates extends CommercialStates {
  final String error;

  CommercialLatestErrorStates({this.error});
}

class CommercialFooterLoadingStates extends CommercialStates {}

class CommercialFooterSuccessStates extends CommercialStates {
  CommercialModal commercialFooter;
  CommercialFooterSuccessStates({this.commercialFooter});
}

class CommercialFooterErrorStates extends CommercialStates {
  final String error;

  CommercialFooterErrorStates({this.error});
}

class CommercialSingleProjectLoadingStates extends CommercialStates {}

class CommercialSingleProjectSuccessStates extends CommercialStates {
  CommercialModal commercialSingleProject;
  CommercialSingleProjectSuccessStates({this.commercialSingleProject});
}

class CommercialSingleProjectErrorStates extends CommercialStates {
  final String error;

  CommercialSingleProjectErrorStates({this.error});
}

class CommercialSingleServiceLoadingStates extends CommercialStates {}

class CommercialSingleServiceSuccessStates extends CommercialStates {
  CommercialModal commercialSingleService;
  CommercialSingleServiceSuccessStates({this.commercialSingleService});
}

class CommercialSingleServiceErrorStates extends CommercialStates {
  final String error;

  CommercialSingleServiceErrorStates({this.error});
}
