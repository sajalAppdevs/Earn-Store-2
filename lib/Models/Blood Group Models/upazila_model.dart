class UpazilaModel {
  bool? status;
  List<Upazilas>? upazilas;

  UpazilaModel({this.status, this.upazilas});

  UpazilaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['upazilas'] != null) {
      upazilas = <Upazilas>[];
      json['upazilas'].forEach((v) {
        upazilas!.add(Upazilas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (upazilas != null) {
      data['upazilas'] = upazilas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Upazilas {
  int? id;
  String? name;
  int? districtId;

  Upazilas({this.id, this.name, this.districtId});

  Upazilas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    districtId = json['district_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['district_id'] = districtId;
    return data;
  }
}
