class ContentModel {
  bool? status;
  String? message;
  List<StreamingHubs>? streamingHubs;

  ContentModel({this.status, this.message, this.streamingHubs});

  ContentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['streamingHubs'] != null) {
      streamingHubs = <StreamingHubs>[];
      json['streamingHubs'].forEach((v) {
        streamingHubs!.add(StreamingHubs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (streamingHubs != null) {
      data['streamingHubs'] = streamingHubs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StreamingHubs {
  int? id;
  String? image;
  String? name;

  StreamingHubs({this.id, this.image, this.name});

  StreamingHubs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}
