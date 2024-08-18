class GroupMessageModel {
  bool? status;
  String? msg;
  Data? data;

  GroupMessageModel({this.status, this.msg, this.data});

  GroupMessageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Messages>? messages;
  Pagination? pagination;

  Data({this.messages, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Messages {
  int? id;
  String? convId;
  int? grpConvId;
  int? fromId;
  String? message;
  String? createdAt;
  String? updatedAt;
  int? fromUserId;
  String? fromUserName;
  List<ToUsers>? toUsers;

  Messages(
      {this.id,
      this.convId,
      this.grpConvId,
      this.fromId,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.fromUserId,
      this.fromUserName,
      this.toUsers});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    convId = json['conv_id'];
    grpConvId = json['grp_conv_id'];
    fromId = json['from_id'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fromUserId = json['from_user_id'];
    fromUserName = json['from_user_name'];
    if (json['to_users'] != null) {
      toUsers = <ToUsers>[];
      json['to_users'].forEach((v) {
        toUsers!.add(ToUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['conv_id'] = convId;
    data['grp_conv_id'] = grpConvId;
    data['from_id'] = fromId;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['from_user_id'] = fromUserId;
    data['from_user_name'] = fromUserName;
    if (toUsers != null) {
      data['to_users'] = toUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToUsers {
  int? toId;
  String? toUserName;

  ToUsers({this.toId, this.toUserName});

  ToUsers.fromJson(Map<String, dynamic> json) {
    toId = json['to_id'];
    toUserName = json['to_user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to_id'] = toId;
    data['to_user_name'] = toUserName;
    return data;
  }
}

class Pagination {
  int? total;
  int? page;
  int? limit;
  int? totalPages;

  Pagination({this.total, this.page, this.limit, this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    return data;
  }
}
