class PopularCoursesModel {
  bool? status;
  String? message;
  List<Courses>? courses;

  PopularCoursesModel({this.status, this.message, this.courses});

  PopularCoursesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  String? image;
  String? title;
  String? instructor;
  int? price;
  int? discountedPrice;
  int? catId;
  String? description;
  int? totalEnrolled;
  String? duration;
  String? time;
  int? totalVideoLecture;
  int? totalPdf;
  String? video;
  String? learningOutcome;
  String? courseDetails;
  String? createdAt;
  String? updatedAt;

  Courses(
      {this.id,
      this.image,
      this.title,
      this.instructor,
      this.price,
      this.discountedPrice,
      this.catId,
      this.description,
      this.totalEnrolled,
      this.duration,
      this.time,
      this.totalVideoLecture,
      this.totalPdf,
      this.video,
      this.learningOutcome,
      this.courseDetails,
      this.createdAt,
      this.updatedAt});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    instructor = json['instructor'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    catId = json['cat_id'];
    description = json['description'];
    totalEnrolled = json['total_enrolled'];
    duration = json['duration'];
    time = json['time'];
    totalVideoLecture = json['total_video_lecture'];
    totalPdf = json['total_pdf'];
    video = json['video'];
    learningOutcome = json['learning_outcome'];
    courseDetails = json['course_details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['instructor'] = instructor;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    data['cat_id'] = catId;
    data['description'] = description;
    data['total_enrolled'] = totalEnrolled;
    data['duration'] = duration;
    data['time'] = time;
    data['total_video_lecture'] = totalVideoLecture;
    data['total_pdf'] = totalPdf;
    data['video'] = video;
    data['learning_outcome'] = learningOutcome;
    data['course_details'] = courseDetails;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
