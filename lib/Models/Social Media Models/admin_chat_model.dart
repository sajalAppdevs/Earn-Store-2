class AdminChatModel {
  bool? status;
  List<ChatDetails>? chatDetails;

  AdminChatModel({this.status, this.chatDetails});

  AdminChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['chat_details'] != null) {
      chatDetails = <ChatDetails>[];
      json['chat_details'].forEach((v) {
        chatDetails!.add(ChatDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (chatDetails != null) {
      data['chat_details'] = chatDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatDetails {
  int? chatId;
  String? chatCreatedAt;
  String? chatUpdatedAt;
  int? customerId;
  String? customerName;
  String? customerImage;
  int? adminId;
  String? adminName;
  String? adminImage;
  int? messageId;
  String? message;
  String? messageCreatedAt;
  String? messageUpdatedAt;

  ChatDetails(
      {this.chatId,
      this.chatCreatedAt,
      this.chatUpdatedAt,
      this.customerId,
      this.customerName,
      this.customerImage,
      this.adminId,
      this.adminName,
      this.adminImage,
      this.messageId,
      this.message,
      this.messageCreatedAt,
      this.messageUpdatedAt});

  ChatDetails.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    chatCreatedAt = json['chat_created_at'];
    chatUpdatedAt = json['chat_updated_at'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerImage = json['customer_image'];
    adminId = json['admin_id'];
    adminName = json['admin_name'];
    adminImage = json['admin_image'];
    messageId = json['message_id'];
    message = json['message'];
    messageCreatedAt = json['message_created_at'];
    messageUpdatedAt = json['message_updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_id'] = chatId;
    data['chat_created_at'] = chatCreatedAt;
    data['chat_updated_at'] = chatUpdatedAt;
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    data['customer_image'] = customerImage;
    data['admin_id'] = adminId;
    data['admin_name'] = adminName;
    data['admin_image'] = adminImage;
    data['message_id'] = messageId;
    data['message'] = message;
    data['message_created_at'] = messageCreatedAt;
    data['message_updated_at'] = messageUpdatedAt;
    return data;
  }
}
