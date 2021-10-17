

class ProjectModals {
  ProjectResponse response;
  ProjectModals.fromJson(Map<String, dynamic> json) {
    response =  ProjectResponse.fromJson(json['resonse']);
  }
}


class ProjectResponse {
  int status;
  List<ProjectResult> result = [];

  ProjectResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['result'].forEach((element) {
       result.add(ProjectResult.fromJson(element));
    });
  }
}

class ProjectResult {
  String id;
  String name;
  String icon;
  String url;
  String create_at;
  String type;

  ProjectResult.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
    create_at = json['create at'];
    type = json['type'];
  }
}


