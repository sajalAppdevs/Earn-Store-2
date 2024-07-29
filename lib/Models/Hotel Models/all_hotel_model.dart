class AllHotelModel {
  bool? status;
  List<Hotel>? hotel;

  AllHotelModel({this.status, this.hotel});

  AllHotelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['hotel'] != null) {
      hotel = <Hotel>[];
      json['hotel'].forEach((v) {
        hotel!.add(Hotel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (hotel != null) {
      data['hotel'] = hotel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hotel {
  int? id;
  String? hotelName;
  String? location;
  String? longitude;
  String? latitude;
  double? rating;
  String? reviews;
  String? image;
  String? mobileNumber;
  String? email;
  String? checkingIn;
  String? checkingOut;
  String? createdAt;
  String? updatedAt;

  Hotel(
      {this.id,
      this.hotelName,
      this.location,
      this.longitude,
      this.latitude,
      this.rating,
      this.reviews,
      this.image,
      this.mobileNumber,
      this.email,
      this.checkingIn,
      this.checkingOut,
      this.createdAt,
      this.updatedAt});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelName = json['hotel_name'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rating = json['rating'];
    reviews = json['reviews'];
    image = json['image'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    checkingIn = json['checking_in'];
    checkingOut = json['checking_out'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hotel_name'] = hotelName;
    data['location'] = location;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['rating'] = rating;
    data['reviews'] = reviews;
    data['image'] = image;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['checking_in'] = checkingIn;
    data['checking_out'] = checkingOut;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
