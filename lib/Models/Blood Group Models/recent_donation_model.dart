class RecentDonationModel {
  bool? status;
  List<Donations>? donations;

  RecentDonationModel({this.status, this.donations});

  RecentDonationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['donations'] != null) {
      donations = <Donations>[];
      json['donations'].forEach((v) {
        donations!.add(Donations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (donations != null) {
      data['donations'] = donations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Donations {
  int? id;
  int? donorId;
  String? place;
  String? reason;
  String? status;
  String? receivedBy;
  String? donationDate;
  String? createdAt;
  String? updatedAt;
  String? donorName;
  String? donorMobileNumber;
  int? donorBloodGroupId;
  String? donorBloodGroupName;

  Donations(
      {this.id,
      this.donorId,
      this.place,
      this.reason,
      this.status,
      this.receivedBy,
      this.donationDate,
      this.createdAt,
      this.updatedAt,
      this.donorName,
      this.donorMobileNumber,
      this.donorBloodGroupId,
      this.donorBloodGroupName});

  Donations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    donorId = json['donor_id'];
    place = json['place'];
    reason = json['reason'];
    status = json['status'];
    receivedBy = json['received_by'];
    donationDate = json['donation_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    donorName = json['donor_name'];
    donorMobileNumber = json['donor_mobile_number'];
    donorBloodGroupId = json['donor_blood_group_id'];
    donorBloodGroupName = json['donor_blood_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['donor_id'] = donorId;
    data['place'] = place;
    data['reason'] = reason;
    data['status'] = status;
    data['received_by'] = receivedBy;
    data['donation_date'] = donationDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['donor_name'] = donorName;
    data['donor_mobile_number'] = donorMobileNumber;
    data['donor_blood_group_id'] = donorBloodGroupId;
    data['donor_blood_group_name'] = donorBloodGroupName;
    return data;
  }
}
