class ProjectModels {
  String id;
  String name;
  String image;

  ProjectModels({
    this.id,
    this.name,
    this.image,
  });

  ProjectModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
