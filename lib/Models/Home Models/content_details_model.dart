class ContentDetailsModel {
  bool? status;
  String? msg;
  List<Response>? response;

  ContentDetailsModel({this.status, this.msg, this.response});

  ContentDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  int? id;
  String? image;
  String? link;
  int? sHubId;
  String? createdAt;
  String? updatedAt;
  String? streamingHubName;

  Response(
      {this.id,
      this.image,
      this.link,
      this.sHubId,
      this.createdAt,
      this.updatedAt,
      this.streamingHubName});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    link = json['link'];
    sHubId = json['s_hub_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    streamingHubName = json['streaming_hub_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['link'] = link;
    data['s_hub_id'] = sHubId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['streaming_hub_name'] = streamingHubName;
    return data;
  }
}
