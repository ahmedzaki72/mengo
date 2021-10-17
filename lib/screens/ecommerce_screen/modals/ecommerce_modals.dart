class ECommerceModal {
  ECommerceResponse commercialResponse;

  ECommerceModal.fromJson(Map<String, dynamic> json) {
    commercialResponse = ECommerceResponse.fromJson(json['response']);
  }
}

class ECommerceResponse {
  String status;
  ECommerceResult portfolioResult;

  ECommerceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    portfolioResult = ECommerceResult.fromJson(json['result']);
  }
}

class ECommerceResult {
  String message;

  ECommerceResult.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
