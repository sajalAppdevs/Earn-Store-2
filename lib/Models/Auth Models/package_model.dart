class AllPackageModel {
  bool? status;
  List<Packages>? packages;

  AllPackageModel({this.status, this.packages});

  AllPackageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  String? packageName;
  String? description;
  int? price;

  Packages({this.id, this.packageName, this.description, this.price});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['package_name'] = packageName;
    data['description'] = description;
    data['price'] = price;
    return data;
  }
}
