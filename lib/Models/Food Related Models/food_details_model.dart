class FoodDetailsModel {
  bool? status;
  Data? data;

  FoodDetailsModel({this.status, this.data});

  FoodDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  List<String>? images;
  int? price;
  int? resId;
  int? catId;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? restaurantId;
  String? restaurantName;
  String? catName;

  Data(
      {this.id,
      this.name,
      this.image,
      this.images,
      this.price,
      this.resId,
      this.catId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.restaurantId,
      this.restaurantName,
      this.catName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    images = json['images'].cast<String>();
    price = json['price'];
    resId = json['res_id'];
    catId = json['cat_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['images'] = images;
    data['price'] = price;
    data['res_id'] = resId;
    data['cat_id'] = catId;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['restaurant_id'] = restaurantId;
    data['restaurant_name'] = restaurantName;
    data['cat_name'] = catName;
    return data;
  }
}
