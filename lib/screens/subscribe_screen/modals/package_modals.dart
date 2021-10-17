class PackageModals {
  PackageResponse packageResponse;
  
  PackageModals.fromJson(Map<String, dynamic> json) {
    packageResponse = PackageResponse.fromJson(json['resonse']);
  }
}

class PackageResponse {
  int status;
  List<PackageResult> packageResult = [];

  PackageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['result'].forEach((element) {
      packageResult.add(PackageResult.fromJson(element));
    });
  }
}

class PackageResult {
  String id;
  String english_name;
  String arabic_name;
  String project_no;
  String price;

  PackageResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    english_name = json['english name'];
    arabic_name = json['arabic name'];
    project_no = json['project_no'];
    price = json['price'];
  }
}
