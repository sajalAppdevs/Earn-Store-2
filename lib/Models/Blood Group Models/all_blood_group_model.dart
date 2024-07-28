class AllBloodGroup {
  bool? status;
  List<BloodGroups>? bloodGroups;

  AllBloodGroup({this.status, this.bloodGroups});

  AllBloodGroup.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['blood_groups'] != null) {
      bloodGroups = <BloodGroups>[];
      json['blood_groups'].forEach((v) {
        bloodGroups!.add(BloodGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (bloodGroups != null) {
      data['blood_groups'] = bloodGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BloodGroups {
  int? id;
  String? bloodGroup;

  BloodGroups({this.id, this.bloodGroup});

  BloodGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodGroup = json['blood_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['blood_group'] = bloodGroup;
    return data;
  }
}
