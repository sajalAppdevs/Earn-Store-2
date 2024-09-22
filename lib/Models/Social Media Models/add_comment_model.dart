class AddCommentModel {
  bool? status;
  String? msg;
  Comment? comment;

  AddCommentModel({this.status, this.msg, this.comment});

  AddCommentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    comment =
        json['Comment'] != null ? Comment.fromJson(json['Comment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (comment != null) {
      data['Comment'] = comment!.toJson();
    }
    return data;
  }
}

class Comment {
  String? image;
  String? postId;
  String? userId;

  Comment({this.image, this.postId, this.userId});

  Comment.fromJson(Map<String, dynamic> json) {
    image = json['image'].toString();
    postId = json['post_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['post_id'] = postId;
    data['user_id'] = userId;
    return data;
  }
}
