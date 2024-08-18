class PostCommentModel {
  bool? status;
  List<Comments>? comments;

  PostCommentModel({this.status, this.comments});

  PostCommentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  int? postId;
  int? userId;
  String? text;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? name;

  Comments(
      {this.id,
      this.postId,
      this.userId,
      this.text,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.name});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    text = json['text'];
    image = json['image'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['user_id'] = userId;
    data['text'] = text;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    return data;
  }
}
