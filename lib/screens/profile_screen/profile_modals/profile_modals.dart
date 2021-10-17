class ProfileModals {
  ProfileResponse profileResponse;
  ProfileModals.fromJson(Map<String, dynamic> json) {
    if(json != null )
    profileResponse = ProfileResponse.fromJson(json['resonse']);
  }
}

class ProfileResponse {
  int status;
  ProfileResult profileResult;

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    profileResult = ProfileResult.fromJson(json['result']);
  }
}

class ProfileResult {
  String name;
  String email;
  String company_name;
  String package_id;
  String profile_image;

  ProfileResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    company_name = json['company name'];
    package_id = json['package id'];
    profile_image = json['profile image'];
  }
}

class ProfileChangeModals {
  ResponseChange responseChange;

  ProfileChangeModals.fromJson(Map<String, dynamic> json) {
    responseChange = ResponseChange.fromJson(json['resonse']);
  }
}

class ResponseChange {
  int status;
  ResultChange resultChange;

  ResponseChange.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultChange = ResultChange.fromJson(json['result']);
  }
}

class ResultChange {
  String message;

  ResultChange.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
