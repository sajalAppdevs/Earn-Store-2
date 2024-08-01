class HelpCenterModel {
  List<HelpCenter>? helpCenter;

  HelpCenterModel({this.helpCenter});

  HelpCenterModel.fromJson(Map<String, dynamic> json) {
    if (json['helpCenter'] != null) {
      helpCenter = <HelpCenter>[];
      json['helpCenter'].forEach((v) {
        helpCenter!.add(HelpCenter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (helpCenter != null) {
      data['helpCenter'] = helpCenter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HelpCenter {
  int? id;
  String? customerService;
  String? website;
  String? youtube;
  String? facebook;
  String? instagram;
  String? shareLink;

  HelpCenter(
      {this.id,
      this.customerService,
      this.website,
      this.youtube,
      this.facebook,
      this.instagram,
      this.shareLink});

  HelpCenter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerService = json['customer_service'];
    website = json['website'];
    youtube = json['youtube'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    shareLink = json['share_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_service'] = customerService;
    data['website'] = website;
    data['youtube'] = youtube;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['share_link'] = shareLink;
    return data;
  }
}
