class DonorModel {
  bool? status;
  List<Donors>? donors;

  DonorModel({this.status, this.donors});

  DonorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['donors'] != null) {
      donors = <Donors>[];
      json['donors'].forEach((v) {
        donors!.add(Donors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (donors != null) {
      data['donors'] = donors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Donors {
  String? name;
  String? mobileNumber;
  int? bloodGroupId;
  String? bloodGroupName;

  Donors(
      {this.name, this.mobileNumber, this.bloodGroupId, this.bloodGroupName});

  Donors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNumber = json['mobile_number'];
    bloodGroupId = json['blood_group_id'];
    bloodGroupName = json['blood_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['mobile_number'] = mobileNumber;
    data['blood_group_id'] = bloodGroupId;
    data['blood_group_name'] = bloodGroupName;
    return data;
  }
}
