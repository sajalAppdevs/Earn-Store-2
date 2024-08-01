class AllHotelModel {
  bool? status;
  List<Hotels>? hotels;

  AllHotelModel({this.status, this.hotels});

  AllHotelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['hotels'] != null) {
      hotels = <Hotels>[];
      json['hotels'].forEach((v) {
        hotels!.add(Hotels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (hotels != null) {
      data['hotels'] = hotels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hotels {
  int? id;
  String? hotelName;
  String? location;
  String? longitude;
  String? latitude;
  String? rating;
  String? image;
  String? mobileNumber;
  String? email;
  String? checkingIn;
  String? checkingOut;
  String? createdAt;
  String? updatedAt;
  String? review;
  int? reviewRating;
  int? reviewUserId;
  int? reviewHotelId;
  List<Reviews>? reviews;

  Hotels(
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
      this.updatedAt,
      this.review,
      this.reviewRating,
      this.reviewUserId,
      this.reviewHotelId,
      this.reviews});

  Hotels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelName = json['hotel_name'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rating = json['rating'].toString();
    image = json['image'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    checkingIn = json['checking_in'];
    checkingOut = json['checking_out'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    review = json['review'];
    reviewRating = json['review_rating'];
    reviewUserId = json['review_user_id'];
    reviewHotelId = json['review_hotel_id'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
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
    data['review'] = review;
    data['review_rating'] = reviewRating;
    data['review_user_id'] = reviewUserId;
    data['review_hotel_id'] = reviewHotelId;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? review;
  String? rating;
  int? userId;
  int? hotelId;

  Reviews({this.review, this.rating, this.userId, this.hotelId});

  Reviews.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    rating = json['rating'].toString();
    userId = json['user_id'];
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review'] = review;
    data['rating'] = rating;
    data['user_id'] = userId;
    data['hotel_id'] = hotelId;
    return data;
  }
}
