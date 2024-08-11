class CarByShopModel {
  bool? status;
  List<Data>? data;

  CarByShopModel({this.status, this.data});

  CarByShopModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  int? seat;
  int? price;
  int? carShopId;
  String? createdAt;
  String? updatedAt;
  String? carShopName;

  Data(
      {this.id,
      this.name,
      this.image,
      this.images,
      this.description,
      this.seat,
      this.price,
      this.carShopId,
      this.createdAt,
      this.updatedAt,
      this.carShopName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    images = json['images'].cast<String>();
    description = json['description'];
    seat = json['seat'];
    price = json['price'];
    carShopId = json['car_shop_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    carShopName = json['car_shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['images'] = images;
    data['description'] = description;
    data['seat'] = seat;
    data['price'] = price;
    data['car_shop_id'] = carShopId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['car_shop_name'] = carShopName;
    return data;
  }
}
