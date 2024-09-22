class DistrictModel {
  bool? status;
  List<Districts>? districts;

  DistrictModel({this.status, this.districts});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['districts'] != null) {
      districts = <Districts>[];
      json['districts'].forEach((v) {
        districts!.add(Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (districts != null) {
      data['districts'] = districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Districts {
  int? id;
  String? name;
  int? divisionId;

  Districts({this.id, this.name, this.divisionId});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    divisionId = json['division_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['division_id'] = divisionId;
    return data;
  }
}
