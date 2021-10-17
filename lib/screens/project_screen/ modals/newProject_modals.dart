class NewProjectModals {
  NewProjectResponse newProjectResponse;

  NewProjectModals.fromJson(Map<String, dynamic> json) {
    newProjectResponse = NewProjectResponse.fromJson(json['response']);
  }
}

class NewProjectResponse {
  String status;
  NewProjectResult newResult;

  NewProjectResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    newResult = NewProjectResult.fromJson(json['result']);
  }
}

class NewProjectResult {
  String message;

  NewProjectResult.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
