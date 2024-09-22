class CreateChatModel {
  bool? status;
  String? message;
  int? chatId;

  CreateChatModel({this.status, this.message, this.chatId});

  CreateChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    chatId = json['chat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['chat_id'] = chatId;
    return data;
  }
}
