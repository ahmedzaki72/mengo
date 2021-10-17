class CommercialModal {
  CommercialResponse commercialResponse;

  CommercialModal.fromJson(Map<String, dynamic> json) {
    commercialResponse = CommercialResponse.fromJson(json['response']);
  }
}

class CommercialResponse {
  String status;
  CommercialResult portfolioResult;

  CommercialResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    portfolioResult = CommercialResult.fromJson(json['result']);
  }
}

class CommercialResult {
  String message;

  CommercialResult.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
