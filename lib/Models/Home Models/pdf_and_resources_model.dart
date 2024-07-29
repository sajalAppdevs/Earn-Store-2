class PDFAndResourcesModel {
  bool? status;
  List<Pdfs>? pdfs;

  PDFAndResourcesModel({this.status, this.pdfs});

  PDFAndResourcesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Pdfs'] != null) {
      pdfs = <Pdfs>[];
      json['Pdfs'].forEach((v) {
        pdfs!.add(Pdfs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (pdfs != null) {
      data['Pdfs'] = pdfs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pdfs {
  int? id;
  String? title;
  int? price;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  Pdfs(
      {this.id,
      this.title,
      this.price,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt});

  Pdfs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
