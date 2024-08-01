class HotelDetailsModel {
  bool? status;
  Hotel? hotel;
  List<HotelRooms>? hotelRooms;
  List<Reviews>? reviews;

  HotelDetailsModel({this.status, this.hotel, this.hotelRooms, this.reviews});

  HotelDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
    if (json['hotelRooms'] != null) {
      hotelRooms = <HotelRooms>[];
      json['hotelRooms'].forEach((v) {
        hotelRooms!.add(HotelRooms.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    if (hotelRooms != null) {
      data['hotelRooms'] = hotelRooms!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
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

class HotelRooms {
  int? id;
  int? hotelId;
  String? roomName;
  int? totalNumRoom;
  int? pricePerNight;
  String? facilities;
  String? image;
  List<String>? images;
  String? createdAt;
  String? updatedAt;

  HotelRooms(
      {this.id,
      this.hotelId,
      this.roomName,
      this.totalNumRoom,
      this.pricePerNight,
      this.facilities,
      this.image,
      this.images,
      this.createdAt,
      this.updatedAt});

  HotelRooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    roomName = json['room_name'];
    totalNumRoom = json['total_num_room'];
    pricePerNight = json['price_per_night'];
    facilities = json['facilities'];
    image = json['image'];
    images = json['images'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hotel_id'] = hotelId;
    data['room_name'] = roomName;
    data['total_num_room'] = totalNumRoom;
    data['price_per_night'] = pricePerNight;
    data['facilities'] = facilities;
    data['image'] = image;
    data['images'] = images;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Reviews {
  int? id;
  String? review;
  double? rating;
  int? hotelId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
      this.review,
      this.rating,
      this.hotelId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    review = json['review'];
    rating = json['rating'];
    hotelId = json['hotel_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['review'] = review;
    data['rating'] = rating;
    data['hotel_id'] = hotelId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
