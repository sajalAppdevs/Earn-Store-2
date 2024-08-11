class FoodModel {
  bool? status;
  List<Data>? data;

  FoodModel({this.status, this.data});

  FoodModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
