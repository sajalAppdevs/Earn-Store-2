class WithdrawHistoryModel {
  String? status;
  String? messege;
  List<Withdraw>? withdraw;

  WithdrawHistoryModel({this.status, this.messege, this.withdraw});

  WithdrawHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    if (json['withdraw'] != null) {
      withdraw = <Withdraw>[];
      json['withdraw'].forEach((v) {
        withdraw!.add(Withdraw.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messege'] = messege;
    if (withdraw != null) {
      data['withdraw'] = withdraw!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Withdraw {
  int? id;
  int? userid;
  String? day;
  String? date;
  int? amount;
  String? status;
  String? number;
  String? operator;
  String? createdAt;
  String? updatedAt;

  Withdraw(
      {this.id,
      this.userid,
      this.day,
      this.date,
      this.amount,
      this.status,
      this.number,
      this.operator,
      this.createdAt,
      this.updatedAt});

  Withdraw.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    day = json['day'];
    date = json['date'];
    amount = json['amount'];
    status = json['status'];
    number = json['number'];
    operator = json['operator'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['day'] = day;
    data['date'] = date;
    data['amount'] = amount;
    data['status'] = status;
    data['number'] = number;
    data['operator'] = operator;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
