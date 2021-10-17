class PortfolioModal {
  PortfolioResponse portfolioResponse;

  PortfolioModal.fromJson(Map<String, dynamic> json) {
    portfolioResponse = PortfolioResponse.fromJson(json['response']);
  }
}

class PortfolioResponse {
  String status;
  PortfolioResult portfolioResult;

  PortfolioResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    portfolioResult = PortfolioResult.fromJson(json['result']);
  }
}

class PortfolioResult {
  String message;

  PortfolioResult.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
