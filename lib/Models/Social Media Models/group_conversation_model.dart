class GroupConversationModel {
  bool? status;
  String? msg;
  List<Groups>? groups;

  GroupConversationModel({this.status, this.msg, this.groups});

  GroupConversationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  int? grpConvId;
  String? name;
  String? recentMessage;
  String? recentMessageTime;

  Groups(
      {this.grpConvId, this.name, this.recentMessage, this.recentMessageTime});

  Groups.fromJson(Map<String, dynamic> json) {
    grpConvId = json['grp_conv_id'];
    name = json['name'];
    recentMessage = json['recent_message'];
    recentMessageTime = json['recent_message_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grp_conv_id'] = grpConvId;
    data['name'] = name;
    data['recent_message'] = recentMessage;
    data['recent_message_time'] = recentMessageTime;
    return data;
  }
}
