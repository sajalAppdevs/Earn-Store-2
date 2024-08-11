class CarShopModel {
  bool? status;
  List<CarShop>? carShop;

  CarShopModel({this.status, this.carShop});

  CarShopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['car_shop'] != null) {
      carShop = <CarShop>[];
      json['car_shop'].forEach((v) {
        carShop!.add(CarShop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (carShop != null) {
      data['car_shop'] = carShop!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarShop {
  int? id;
  String? name;
  String? image;
  String? address;
  String? lang;
  String? lat;
  String? mobileNumber;
  int? upazilaId;
  int? districtId;
  int? divisionId;
  String? openingTime;
  String? closingTime;
  String? email;
  String? upazilaName;
  String? districtName;
  String? divisionName;

  CarShop(
      {this.id,
      this.name,
      this.image,
      this.address,
      this.lang,
      this.lat,
      this.mobileNumber,
      this.upazilaId,
      this.districtId,
      this.divisionId,
      this.openingTime,
      this.closingTime,
      this.email,
      this.upazilaName,
      this.districtName,
      this.divisionName});

  CarShop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    address = json['address'];
    lang = json['lang'];
    lat = json['lat'];
    mobileNumber = json['mobile_number'];
    upazilaId = json['upazila_id'];
    districtId = json['district_id'];
    divisionId = json['division_id'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    email = json['email'];
    upazilaName = json['upazila_name'];
    districtName = json['district_name'];
    divisionName = json['division_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['address'] = address;
    data['lang'] = lang;
    data['lat'] = lat;
    data['mobile_number'] = mobileNumber;
    data['upazila_id'] = upazilaId;
    data['district_id'] = districtId;
    data['division_id'] = divisionId;
    data['opening_time'] = openingTime;
    data['closing_time'] = closingTime;
    data['email'] = email;
    data['upazila_name'] = upazilaName;
    data['district_name'] = districtName;
    data['division_name'] = divisionName;
    return data;
  }
}
