class GeneralInfoModel {
  String? status;
  String? messege;
  GeneralInfos? generalInfos;

  GeneralInfoModel({this.status, this.messege, this.generalInfos});

  GeneralInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    generalInfos = json['generalInfos'] != null
        ? GeneralInfos.fromJson(json['generalInfos'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messege'] = messege;
    if (generalInfos != null) {
      data['generalInfos'] = generalInfos!.toJson();
    }
    return data;
  }
}

class GeneralInfos {
  int? id;
  String? headline;
  double? point;
  int? minWithdraw;
  int? minRefer;
  int? minRecharge;

  GeneralInfos(
      {this.id,
      this.headline,
      this.point,
      this.minWithdraw,
      this.minRefer,
      this.minRecharge});

  GeneralInfos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headline = json['headline'];
    point = json['point'];
    minWithdraw = json['min_withdraw'];
    minRefer = json['min_refer'];
    minRecharge = json['min_recharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['headline'] = headline;
    data['point'] = point;
    data['min_withdraw'] = minWithdraw;
    data['min_refer'] = minRefer;
    data['min_recharge'] = minRecharge;
    return data;
  }
}
