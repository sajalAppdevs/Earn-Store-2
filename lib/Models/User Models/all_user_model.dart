class AllUserModel {
  List<Users>? users;

  AllUserModel({this.users});

  AllUserModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
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
  String? packageId;
  int? isDonor;
  String? title;
  String? studiedAt;
  String? workingAt;
  String? address;
  String? relationship;
  String? bloodGroupId;
  String? gender;
  String? createdAt;
  String? updatedAt;
  String? packageName;
  String? bloodGroupName;
  String? countryName;

  Users(
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
      this.isDonor,
      this.title,
      this.studiedAt,
      this.workingAt,
      this.address,
      this.relationship,
      this.bloodGroupId,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.packageName,
      this.bloodGroupName,
      this.countryName});

  Users.fromJson(Map<String, dynamic> json) {
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
    packageId = json['package_id'].toString();
    isDonor = json['is_donor'];
    title = json['title'].toString();
    studiedAt = json['studied_at'];
    workingAt = json['working_at'];
    address = json['address'];
    relationship = json['relationship'];
    bloodGroupId = json['blood_group_id'].toString();
    gender = json['gender'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    packageName = json['package_name'].toString();
    bloodGroupName = json['blood_group_name'].toString();
    countryName = json['country_name'].toString();
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
    data['is_donor'] = isDonor;
    data['title'] = title;
    data['studied_at'] = studiedAt;
    data['working_at'] = workingAt;
    data['address'] = address;
    data['relationship'] = relationship;
    data['blood_group_id'] = bloodGroupId;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['package_name'] = packageName;
    data['blood_group_name'] = bloodGroupName;
    data['country_name'] = countryName;
    return data;
  }
}
