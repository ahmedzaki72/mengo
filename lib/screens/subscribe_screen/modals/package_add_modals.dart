

class PackageAddModals  {
   ResponseAddPackage responseAddPackage;
   
   PackageAddModals.fromJson(Map<String, dynamic> json) {
     responseAddPackage = ResponseAddPackage.fromJson(json['resonse']);
   }
}

class ResponseAddPackage {
  int status;
  ResultAddPackage resultAddPackage;

  ResponseAddPackage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultAddPackage = ResultAddPackage.fromJson(json['result']);
  }
}

class ResultAddPackage{
  String message;

  ResultAddPackage.fromJson(Map<String , dynamic> json) {
    message = json['message'];
  }
}