class DivisionModel {
  bool? status;
  List<Divisions>? divisions;

  DivisionModel({this.status, this.divisions});

  DivisionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['divisions'] != null) {
      divisions = <Divisions>[];
      json['divisions'].forEach((v) {
        divisions!.add(Divisions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (divisions != null) {
      data['divisions'] = divisions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Divisions {
  int? id;
  String? name;

  Divisions({this.id, this.name});

  Divisions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
