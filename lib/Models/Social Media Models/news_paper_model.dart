class NewsPaperModel {
  bool? status;
  List<Newspaper>? newspaper;

  NewsPaperModel({this.status, this.newspaper});

  NewsPaperModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['newspaper'] != null) {
      newspaper = <Newspaper>[];
      json['newspaper'].forEach((v) {
        newspaper!.add(Newspaper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (newspaper != null) {
      data['newspaper'] = newspaper!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Newspaper {
  int? id;
  String? name;
  String? link;
  String? image;

  Newspaper({this.id, this.name, this.link, this.image});

  Newspaper.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['image'] = image;
    return data;
  }
}
