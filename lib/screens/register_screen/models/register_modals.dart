class RegisterModals {
  ResponseData response;
  RegisterModals.fromJson(Map<String, dynamic> json) {
    response = ResponseData.fromJson(json['resonse']);
  }
}

class ResponseData {
  int status;
  ResultData result;

  ResponseData.fromJson(Map<String, dynamic> json) {
     status = json['status'];
     result = ResultData.fromJson(json['result']);
  }
}

class ResultData {
  String message;

  ResultData.fromJson(Map<String, dynamic> json) {
     message = json['message'];
  }
}