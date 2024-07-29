class PopularCoursesModel {
  bool? status;
  List<OnlineCourses>? onlineCourses;

  PopularCoursesModel({this.status, this.onlineCourses});

  PopularCoursesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['onlineCourses'] != null) {
      onlineCourses = <OnlineCourses>[];
      json['onlineCourses'].forEach((v) {
        onlineCourses!.add(OnlineCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (onlineCourses != null) {
      data['onlineCourses'] = onlineCourses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlineCourses {
  int? id;
  String? icon;
  String? appName;
  String? link;
  int? isPopular;
  String? createdAt;
  String? updatedAt;

  OnlineCourses(
      {this.id,
      this.icon,
      this.appName,
      this.link,
      this.isPopular,
      this.createdAt,
      this.updatedAt});

  OnlineCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    appName = json['app_name'];
    link = json['link'];
    isPopular = json['is_popular'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['app_name'] = appName;
    data['link'] = link;
    data['is_popular'] = isPopular;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
