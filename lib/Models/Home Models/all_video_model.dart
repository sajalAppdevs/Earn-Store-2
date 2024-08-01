class AllVideoModel {
  List<SeenVideos>? seenVideos;
  List<UnseenVideos>? unseenVideos;

  AllVideoModel({this.seenVideos, this.unseenVideos});

  AllVideoModel.fromJson(Map<String, dynamic> json) {
    if (json['seenVideos'] != null) {
      seenVideos = <SeenVideos>[];
      json['seenVideos'].forEach((v) {
        seenVideos!.add(SeenVideos.fromJson(v));
      });
    }
    if (json['unseenVideos'] != null) {
      unseenVideos = <UnseenVideos>[];
      json['unseenVideos'].forEach((v) {
        unseenVideos!.add(UnseenVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seenVideos != null) {
      data['seenVideos'] = seenVideos!.map((v) => v.toJson()).toList();
    }
    if (unseenVideos != null) {
      data['unseenVideos'] = unseenVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnseenVideos {
  int? id;
  String? videoUrl;
  int? point;
  int? status;

  UnseenVideos({this.id, this.videoUrl, this.point, this.status});

  UnseenVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['videoUrl'];
    point = json['point'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['videoUrl'] = videoUrl;
    data['point'] = point;
    data['status'] = status;
    return data;
  }
}

class SeenVideos {
  int? id;
  String? videoUrl;
  int? point;
  int? status;

  SeenVideos({this.id, this.videoUrl, this.point, this.status});

  SeenVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['videoUrl'];
    point = json['point'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['videoUrl'] = videoUrl;
    data['point'] = point;
    data['status'] = status;
    return data;
  }
}
