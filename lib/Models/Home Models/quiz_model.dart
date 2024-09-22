class QuizModel {
  bool? status;
  Quiz? quiz;

  QuizModel({this.status, this.quiz});

  QuizModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    quiz = json['quiz'] != null ? Quiz.fromJson(json['quiz']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (quiz != null) {
      data['quiz'] = quiz!.toJson();
    }
    return data;
  }
}

class Quiz {
  int? id;
  String? date;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? option5;
  int? answer;
  int? points;
  String? createdAt;
  String? updatedAt;

  Quiz(
      {this.id,
      this.date,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.option5,
      this.answer,
      this.points,
      this.createdAt,
      this.updatedAt});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    option5 = json['option5'].toString();
    answer = json['answer'];
    points = json['points'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['question'] = question;
    data['option1'] = option1;
    data['option2'] = option2;
    data['option3'] = option3;
    data['option4'] = option4;
    data['option5'] = option5;
    data['answer'] = answer;
    data['points'] = points;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
