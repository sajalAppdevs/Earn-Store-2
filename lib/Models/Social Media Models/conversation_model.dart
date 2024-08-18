class ConversationModel {
  bool? status;
  List<Member>? member;

  ConversationModel({this.status, this.member});

  ConversationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Member {
  int? id;
  int? member1;
  int? member2;
  String? createdAt;
  String? updatedAt;
  String? member1Name;
  String? member1Image;
  String? member2Name;
  String? member2Image;
  String? recentMessage;
  String? recentMessageTime;

  Member(
      {this.id,
      this.member1,
      this.member2,
      this.createdAt,
      this.updatedAt,
      this.member1Name,
      this.member1Image,
      this.member2Name,
      this.member2Image,
      this.recentMessage,
      this.recentMessageTime});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    member1 = json['member1'];
    member2 = json['member2'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    member1Name = json['member1_name'];
    member1Image = json['member1_image'];
    member2Name = json['member2_name'];
    member2Image = json['member2_image'];
    recentMessage = json['recent_message'];
    recentMessageTime = json['recent_message_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member1'] = member1;
    data['member2'] = member2;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['member1_name'] = member1Name;
    data['member1_image'] = member1Image;
    data['member2_name'] = member2Name;
    data['member2_image'] = member2Image;
    data['recent_message'] = recentMessage;
    data['recent_message_time'] = recentMessageTime;
    return data;
  }
}
