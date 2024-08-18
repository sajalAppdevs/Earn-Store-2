class PackageModel {
  bool? status;
  List<Packages>? packages;

  PackageModel({this.status, this.packages});

  PackageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  int? agencyId;
  String? packageName;
  int? price;
  String? facilities;
  List<String>? packageContainer;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? agencyName;
  String? location;
  String? longitude;
  String? latitude;
  String? mobileNumber;
  String? email;

  Packages(
      {this.id,
      this.agencyId,
      this.packageName,
      this.price,
      this.facilities,
      this.packageContainer,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.agencyName,
      this.location,
      this.longitude,
      this.latitude,
      this.mobileNumber,
      this.email});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    packageName = json['package_name'];
    price = json['price'];
    facilities = json['facilities'];
    packageContainer = json['package_container'].cast<String>();
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    agencyName = json['agency_name'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agency_id'] = agencyId;
    data['package_name'] = packageName;
    data['price'] = price;
    data['facilities'] = facilities;
    data['package_container'] = packageContainer;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['agency_name'] = agencyName;
    data['location'] = location;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    return data;
  }
}
