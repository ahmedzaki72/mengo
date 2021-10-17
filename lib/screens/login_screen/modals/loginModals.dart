class LoginModals {
  LoginResponse response;

  LoginModals.fromJson(Map<String, dynamic> json) {
    response = LoginResponse.fromJson(json['Response']);
  }

}

class LoginResponse {
  String status;
  String message;
  LoginResult result;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = LoginResult.fromJson(json['result']);
  }
}

class LoginResult {
  String token;
  String name;
  String email;
  String company_name;
  String package_id;
  String profile_image;

  LoginResult.fromJson(Map<String, dynamic> json) {
     token = json['token'];
     name = json['name'];
     email = json['email'];
     company_name = json['company name'];
     package_id = json['package id'];
     profile_image = json['profile image'];
  }
}
