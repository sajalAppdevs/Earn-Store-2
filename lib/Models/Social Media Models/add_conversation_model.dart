class AddConversationModel {
  bool? status;
  String? msg;
  Conversation? conversation;

  AddConversationModel({this.status, this.msg, this.conversation});

  AddConversationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    conversation = json['conversation'] != null
        ? Conversation.fromJson(json['conversation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (conversation != null) {
      data['conversation'] = conversation!.toJson();
    }
    return data;
  }
}

class Conversation {
  int? id;
  String? member1;
  String? member2;

  Conversation({this.id, this.member1, this.member2});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    member1 = json['member1'];
    member2 = json['member2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member1'] = member1;
    data['member2'] = member2;
    return data;
  }
}
