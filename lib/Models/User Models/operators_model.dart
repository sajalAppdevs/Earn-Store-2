class AllOperatorsModel {
  bool? status;
  String? message;
  List<Operator>? operator;

  AllOperatorsModel({this.status, this.message, this.operator});

  AllOperatorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['operator'] != null) {
      operator = <Operator>[];
      json['operator'].forEach((v) {
        operator!.add(Operator.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (operator != null) {
      data['operator'] = operator!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Operator {
  int? id;
  String? logo;
  String? name;
  int? isDisabled;

  Operator({this.id, this.logo, this.name, this.isDisabled});

  Operator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    isDisabled = json['is_disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo'] = logo;
    data['name'] = name;
    data['is_disabled'] = isDisabled;
    return data;
  }
}
