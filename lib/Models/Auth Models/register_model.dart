class RegisterModel {
  int? responseCode;
  String? status;
  int? userID;
  String? message;

  RegisterModel({this.responseCode, this.status, this.userID, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    status = json['status'];
    userID = json['userID'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['status'] = status;
    data['userID'] = userID;
    data['message'] = message;
    return data;
  }
}
