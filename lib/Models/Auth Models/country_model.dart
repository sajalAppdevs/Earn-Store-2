class CountryModel {
  bool? status;
  List<Countrys>? countrys;

  CountryModel({this.status, this.countrys});

  CountryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Countrys'] != null) {
      countrys = <Countrys>[];
      json['Countrys'].forEach((v) {
        countrys!.add(Countrys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (countrys != null) {
      data['Countrys'] = countrys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countrys {
  int? id;
  String? name;

  Countrys({this.id, this.name});

  Countrys.fromJson(Map<String, dynamic> json) {
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
