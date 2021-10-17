class SubscribeModels {
  String id;
  String title;
  String image;
  String price;

  SubscribeModels({
    this.id,
    this.title,
    this.image,
    this.price,
  });

  SubscribeModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
  }

}
