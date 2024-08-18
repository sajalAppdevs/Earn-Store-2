class SocialMediaModel {
  bool? status;
  List<Posts>? posts;

  SocialMediaModel({this.status, this.posts});

  SocialMediaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  String? image;
  String? video;
  String? text;
  String? createdAt;
  String? updatedAt;
  int? likeCount;
  int? commentCount;

  Posts(
      {this.id,
      this.image,
      this.video,
      this.text,
      this.createdAt,
      this.updatedAt,
      this.likeCount,
      this.commentCount});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    video = json['video'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['video'] = video;
    data['text'] = text;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['like_count'] = likeCount;
    data['comment_count'] = commentCount;
    return data;
  }
}
