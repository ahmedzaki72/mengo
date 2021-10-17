import 'package:mengo/screens/portfolio_screen/modals/portfolio_modal.dart';

abstract class PortfolioStates {}

class PortfolioInitialStates extends PortfolioStates {}

class PortfolioLoadingStates extends PortfolioStates {}

class PortfolioSuccessStates extends PortfolioStates {
  PortfolioModal portfolioModal;
  PortfolioSuccessStates({this.portfolioModal});
}

class PortfolioErrorStates extends PortfolioStates {
  final String error;
  PortfolioErrorStates({this.error});
}

class PortfolioLoadingAboutStates extends PortfolioStates {}

class PortfolioSuccessAboutStates extends PortfolioStates {
  PortfolioModal portfolioAboutModals;
  PortfolioSuccessAboutStates({this.portfolioAboutModals});
}

class PortfolioErrorAboutStates extends PortfolioStates {
  final String error;

  PortfolioErrorAboutStates({this.error});
}

class PortfolioLoadingExperienceStates extends PortfolioStates {}

class PortfolioSuccessExperienceStates extends PortfolioStates {
  PortfolioModal portfolioExperienceModals;
  PortfolioSuccessExperienceStates({this.portfolioExperienceModals});
}

class PortfolioErrorExperienceStates extends PortfolioStates {
  final String error;

  PortfolioErrorExperienceStates({this.error});
}

class PortfolioLoadingSkillsStates extends PortfolioStates {}

class PortfolioSuccessSkillsStates extends PortfolioStates {
  PortfolioModal portfolioSkillsModals;
  PortfolioSuccessSkillsStates({this.portfolioSkillsModals});
}

class PortfolioErrorSkillsStates extends PortfolioStates {
  final String error;

  PortfolioErrorSkillsStates({this.error});
}

class PortfolioLoadingProjectStates extends PortfolioStates {}

class PortfolioSuccessProjectStates extends PortfolioStates {
  PortfolioModal portfolioProjectModals;
  PortfolioSuccessProjectStates({this.portfolioProjectModals});
}

class PortfolioErrorProjectStates extends PortfolioStates {
  final String error;

  PortfolioErrorProjectStates({this.error});
}

class PortfolioLoadingFooterStates extends PortfolioStates {}

class PortfolioSuccessFooterStates extends PortfolioStates {
  PortfolioModal portfolioFooter;
  PortfolioSuccessFooterStates({this.portfolioFooter});
}

class PortfolioErrorFooterStates extends PortfolioStates {
  final String error;

  PortfolioErrorFooterStates({this.error});
}
