class CustomerChatModel {
  bool? status;
  List<int>? chatIds;

  CustomerChatModel({this.status, this.chatIds});

  CustomerChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    chatIds = json['chat_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['chat_ids'] = chatIds;
    return data;
  }
}
