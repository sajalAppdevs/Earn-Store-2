class UserModel {
  String? status;
  String? messege;
  User? user;

  UserModel({this.status, this.messege, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messege'] = messege;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? userid;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? refercode;
  String? myReferCode;
  int? premium;
  String? imageUrl;
  int? point;
  int? refers;
  int? isVerified;
  int? isPaymentVerified;
  int? verificationCode;
  int? country;
  int? packageId;
  String? title;
  String? studiedAt;
  String? workingAt;
  String? address;
  String? relationship;
  String? createdAt;
  String? updatedAt;
  String? countryName;

  User(
      {this.userid,
      this.name,
      this.email,
      this.mobile,
      this.password,
      this.refercode,
      this.myReferCode,
      this.premium,
      this.imageUrl,
      this.point,
      this.refers,
      this.isVerified,
      this.isPaymentVerified,
      this.verificationCode,
      this.country,
      this.packageId,
      this.title,
      this.studiedAt,
      this.workingAt,
      this.address,
      this.relationship,
      this.createdAt,
      this.updatedAt,
      this.countryName});

  User.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    refercode = json['refercode'];
    myReferCode = json['my_refer_code'];
    premium = json['premium'];
    imageUrl = json['imageUrl'];
    point = json['point'];
    refers = json['refers'];
    isVerified = json['is_verified'];
    isPaymentVerified = json['is_payment_verified'];
    verificationCode = json['verification_code'];
    country = json['country'];
    packageId = json['package_id'];
    title = json['title'];
    studiedAt = json['studied_at'];
    workingAt = json['working_at'];
    address = json['address'];
    relationship = json['relationship'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['password'] = password;
    data['refercode'] = refercode;
    data['my_refer_code'] = myReferCode;
    data['premium'] = premium;
    data['imageUrl'] = imageUrl;
    data['point'] = point;
    data['refers'] = refers;
    data['is_verified'] = isVerified;
    data['is_payment_verified'] = isPaymentVerified;
    data['verification_code'] = verificationCode;
    data['country'] = country;
    data['package_id'] = packageId;
    data['title'] = title;
    data['studied_at'] = studiedAt;
    data['working_at'] = workingAt;
    data['address'] = address;
    data['relationship'] = relationship;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['country_name'] = countryName;
    return data;
  }
}
