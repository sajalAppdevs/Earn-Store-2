class BannerModel {
  bool? status;
  String? message;
  List<Banner>? banner;

  BannerModel({this.status, this.message, this.banner});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  int? id;
  String? bannerImageUrl;

  Banner({this.id, this.bannerImageUrl});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImageUrl = json['banner_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner_image_url'] = bannerImageUrl;
    return data;
  }
}
