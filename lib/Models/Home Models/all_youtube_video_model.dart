class AllYoutubeVideoModel {
  List<SeenVideos>? seenVideos;
  List<UnseenVideos>? unseenVideos;

  AllYoutubeVideoModel({this.seenVideos, this.unseenVideos});

  AllYoutubeVideoModel.fromJson(Map<String, dynamic> json) {
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
  int? points;
  int? status;
  String? createdAt;
  String? updatedAt;

  UnseenVideos(
      {this.id,
      this.videoUrl,
      this.points,
      this.status,
      this.createdAt,
      this.updatedAt});

  UnseenVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['video_url'];
    points = json['points'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_url'] = videoUrl;
    data['points'] = points;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SeenVideos {
  int? id;
  String? videoUrl;
  int? points;
  int? status;
  String? createdAt;
  String? updatedAt;

  SeenVideos(
      {this.id,
      this.videoUrl,
      this.points,
      this.status,
      this.createdAt,
      this.updatedAt});

  SeenVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['video_url'];
    points = json['points'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_url'] = videoUrl;
    data['points'] = points;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
