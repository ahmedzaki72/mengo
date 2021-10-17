import 'package:mengo/screens/commericial_screen/modals/commercial_modals.dart';
import 'package:mengo/screens/ecommerce_screen/modals/ecommerce_modals.dart';

abstract class ECommerceStates {}

class ECommerceHomeInitialStates extends ECommerceStates {}

class ECommerceHomeLoadingStates extends ECommerceStates {}

class ECommerceHomeSuccessStates extends ECommerceStates {
  ECommerceModal eCommerceHome;
  ECommerceHomeSuccessStates({this.eCommerceHome});
}

class ECommerceHomeErrorStates extends ECommerceStates {
  final String error;
  ECommerceHomeErrorStates({this.error});
}

class ECommerceOfferProductLoadingStates extends ECommerceStates {}

class ECommerceOfferProductSuccessStates extends ECommerceStates {
  ECommerceModal eCommerceOfferProduct;
  ECommerceOfferProductSuccessStates({this.eCommerceOfferProduct});
}

class ECommerceOfferProductErrorStates extends ECommerceStates {
  final String error;

  ECommerceOfferProductErrorStates({this.error});
}

class ECommerceSalesProductLoadingStates extends ECommerceStates {}

class ECommerceSalesProductSuccessStates extends ECommerceStates {
  ECommerceModal eCommerceSalesProduct;
  ECommerceSalesProductSuccessStates({this.eCommerceSalesProduct});
}

class ECommerceSalesProductErrorStates extends ECommerceStates {
  final String error;

  ECommerceSalesProductErrorStates({this.error});
}

class ECommerceCategoryOneLoadingStates extends ECommerceStates {}

class ECommerceCategoryOneSuccessStates extends ECommerceStates {
  ECommerceModal eCommerceCategoryOne;
  ECommerceCategoryOneSuccessStates({this.eCommerceCategoryOne});
}

class ECommerceCategoryOneErrorStates extends ECommerceStates {
  final String error;

  ECommerceCategoryOneErrorStates({this.error});
}

class ECommerceCategoryTwoLoadingStates extends ECommerceStates {}

class ECommerceCategoryTwoSuccessStates extends ECommerceStates {
  ECommerceModal eCommerceCategoryTwo;
  ECommerceCategoryTwoSuccessStates({this.eCommerceCategoryTwo});
}

class ECommerceCategoryTwoErrorStates extends ECommerceStates {
  final String error;

  ECommerceCategoryTwoErrorStates({this.error});
}


class ECommerceCategoryThreeLoadingStates extends ECommerceStates {}

class ECommerceCategoryThreeSuccessStates extends ECommerceStates {
  ECommerceModal eCommerceCategoryThree;
  ECommerceCategoryThreeSuccessStates({this.eCommerceCategoryThree});
}

class ECommerceCategoryThreeErrorStates extends ECommerceStates {
  final String error;

  ECommerceCategoryThreeErrorStates({this.error});
}



class UploadImagesStates extends ECommerceStates {}
