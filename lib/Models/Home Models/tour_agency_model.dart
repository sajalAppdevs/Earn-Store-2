class TourAgencyModel {
  bool? status;
  List<Agencys>? agencys;

  TourAgencyModel({this.status, this.agencys});

  TourAgencyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Agencys'] != null) {
      agencys = <Agencys>[];
      json['Agencys'].forEach((v) {
        agencys!.add(Agencys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (agencys != null) {
      data['Agencys'] = agencys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Agencys {
  int? id;
  String? agencyName;
  String? image;
  String? location;
  String? longitude;
  String? latitude;
  String? mobileNumber;
  String? email;
  String? createdAt;
  String? updatedAt;

  Agencys(
      {this.id,
      this.agencyName,
      this.image,
      this.location,
      this.longitude,
      this.latitude,
      this.mobileNumber,
      this.email,
      this.createdAt,
      this.updatedAt});

  Agencys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyName = json['agency_name'];
    image = json['image'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agency_name'] = agencyName;
    data['image'] = image;
    data['location'] = location;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
