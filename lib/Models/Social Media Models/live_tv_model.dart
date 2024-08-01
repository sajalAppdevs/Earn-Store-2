class LiveTVModel {
  bool? status;
  List<OnlineTV>? onlineTV;

  LiveTVModel({this.status, this.onlineTV});

  LiveTVModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['onlineTV'] != null) {
      onlineTV = <OnlineTV>[];
      json['onlineTV'].forEach((v) {
        onlineTV!.add(OnlineTV.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (onlineTV != null) {
      data['onlineTV'] = onlineTV!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlineTV {
  int? id;
  String? name;
  String? link;
  String? image;

  OnlineTV({this.id, this.name, this.link, this.image});

  OnlineTV.fromJson(Map<String, dynamic> json) {
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
