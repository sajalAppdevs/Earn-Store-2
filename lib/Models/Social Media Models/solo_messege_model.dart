class SoloMessegeModel {
  bool? status;
  String? msg;
  Data? data;

  SoloMessegeModel({this.status, this.msg, this.data});

  SoloMessegeModel.fromJson(Map<String, dynamic> json) {
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
  int? convId;
  String? grpConvId;
  int? fromId;
  String? message;
  String? createdAt;
  String? updatedAt;
  String? fromUserName;
  String? member1Image;
  String? member2Image;
  int? toId;
  String? toUserName;

  Messages(
      {this.id,
      this.convId,
      this.grpConvId,
      this.fromId,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.fromUserName,
      this.member1Image,
      this.member2Image,
      this.toId,
      this.toUserName});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    convId = json['conv_id'];
    grpConvId = json['grp_conv_id'].toString();
    fromId = json['from_id'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fromUserName = json['from_user_name'];
    member1Image = json['member1_image'];
    member2Image = json['member2_image'];
    toId = json['to_id'];
    toUserName = json['to_user_name'];
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
    data['from_user_name'] = fromUserName;
    data['member1_image'] = member1Image;
    data['member2_image'] = member2Image;
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
