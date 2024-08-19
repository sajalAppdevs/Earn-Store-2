class ParcelDeliveryModel {
  bool? status;
  List<DeliveryCompany>? deliveryCompany;

  ParcelDeliveryModel({this.status, this.deliveryCompany});

  ParcelDeliveryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['delivery_company'] != null) {
      deliveryCompany = <DeliveryCompany>[];
      json['delivery_company'].forEach((v) {
        deliveryCompany!.add(DeliveryCompany.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (deliveryCompany != null) {
      data['delivery_company'] =
          deliveryCompany!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryCompany {
  int? id;
  String? name;
  String? image;
  int? upazilaId;
  int? districtId;
  int? divisionId;
  String? address;
  int? price;
  String? lang;
  String? lat;
  String? mobileNumber;
  String? email;
  String? openingTime;
  String? closingTime;
  String? description;
  String? upazilaName;
  String? districtName;
  String? divisionName;

  DeliveryCompany(
      {this.id,
      this.name,
      this.image,
      this.upazilaId,
      this.districtId,
      this.divisionId,
      this.address,
      this.price,
      this.lang,
      this.lat,
      this.mobileNumber,
      this.email,
      this.openingTime,
      this.closingTime,
      this.description,
      this.upazilaName,
      this.districtName,
      this.divisionName});

  DeliveryCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    upazilaId = json['upazila_id'];
    districtId = json['district_id'];
    divisionId = json['division_id'];
    address = json['address'];
    price = json['price'];
    lang = json['lang'];
    lat = json['lat'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    description = json['description'];
    upazilaName = json['upazila_name'];
    districtName = json['district_name'];
    divisionName = json['division_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['upazila_id'] = upazilaId;
    data['district_id'] = districtId;
    data['division_id'] = divisionId;
    data['address'] = address;
    data['price'] = price;
    data['lang'] = lang;
    data['lat'] = lat;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['opening_time'] = openingTime;
    data['closing_time'] = closingTime;
    data['description'] = description;
    data['upazila_name'] = upazilaName;
    data['district_name'] = districtName;
    data['division_name'] = divisionName;
    return data;
  }
}
