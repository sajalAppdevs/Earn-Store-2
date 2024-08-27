class PopularCourseDetailsModel {
  bool? status;
  String? message;
  Course? course;
  List<Instructor>? instructor;
  List<CourseContainer>? courseContainer;
  List<CourseVideo>? courseVideo;
  List<CourseDetails>? courseDetails;

  PopularCourseDetailsModel(
      {this.status,
      this.message,
      this.course,
      this.instructor,
      this.courseContainer,
      this.courseVideo,
      this.courseDetails});

  PopularCourseDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    if (json['instructor'] != null) {
      instructor = <Instructor>[];
      json['instructor'].forEach((v) {
        instructor!.add(Instructor.fromJson(v));
      });
    }
    if (json['courseContainer'] != null) {
      courseContainer = <CourseContainer>[];
      json['courseContainer'].forEach((v) {
        courseContainer!.add(CourseContainer.fromJson(v));
      });
    }
    if (json['courseVideo'] != null) {
      courseVideo = <CourseVideo>[];
      json['courseVideo'].forEach((v) {
        courseVideo!.add(CourseVideo.fromJson(v));
      });
    }
    if (json['courseDetails'] != null) {
      courseDetails = <CourseDetails>[];
      json['courseDetails'].forEach((v) {
        courseDetails!.add(CourseDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    if (instructor != null) {
      data['instructor'] = instructor!.map((v) => v.toJson()).toList();
    }
    if (courseContainer != null) {
      data['courseContainer'] =
          courseContainer!.map((v) => v.toJson()).toList();
    }
    if (courseVideo != null) {
      data['courseVideo'] = courseVideo!.map((v) => v.toJson()).toList();
    }
    if (courseDetails != null) {
      data['courseDetails'] = courseDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
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
  List<String>? learningOutcome;
  String? courseDetails;
  String? createdAt;
  String? updatedAt;

  Course(
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

  Course.fromJson(Map<String, dynamic> json) {
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
    learningOutcome = json['learning_outcome'].cast<String>();
    courseDetails = json['course_details'].toString();
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

class Instructor {
  int? id;
  String? name;
  String? designation;
  String? image;
  int? courseId;
  String? createdAt;
  String? updatedAt;

  Instructor(
      {this.id,
      this.name,
      this.designation,
      this.image,
      this.courseId,
      this.createdAt,
      this.updatedAt});

  Instructor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    designation = json['designation'];
    image = json['image'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['designation'] = designation;
    data['image'] = image;
    data['course_id'] = courseId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CourseContainer {
  int? id;
  String? title;
  String? description;
  String? image;
  int? courseId;
  String? createdAt;
  String? updatedAt;

  CourseContainer(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.courseId,
      this.createdAt,
      this.updatedAt});

  CourseContainer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['course_id'] = courseId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CourseVideo {
  int? id;
  String? title;
  String? video;
  int? isPaid;
  int? courseId;
  String? createdAt;
  String? updatedAt;

  CourseVideo(
      {this.id,
      this.title,
      this.video,
      this.isPaid,
      this.courseId,
      this.createdAt,
      this.updatedAt});

  CourseVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    video = json['video'];
    isPaid = json['is_paid'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['video'] = video;
    data['is_paid'] = isPaid;
    data['course_id'] = courseId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CourseDetails {
  int? id;
  int? courseId;
  String? title;
  List<String>? description;

  CourseDetails({this.id, this.courseId, this.title, this.description});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    title = json['title'];
    description = json['description'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_id'] = courseId;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
