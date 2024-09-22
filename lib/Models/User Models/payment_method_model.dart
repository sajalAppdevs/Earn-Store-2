class PaymentMethodsModel {
  bool? status;
  List<PaymentMethods>? paymentMethods;

  PaymentMethodsModel({this.status, this.paymentMethods});

  PaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['paymentMethods'] != null) {
      paymentMethods = <PaymentMethods>[];
      json['paymentMethods'].forEach((v) {
        paymentMethods!.add(PaymentMethods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (paymentMethods != null) {
      data['paymentMethods'] = paymentMethods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentMethods {
  int? id;
  String? title;
  String? number;
  String? logo;

  PaymentMethods({this.id, this.title, this.number, this.logo});

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    number = json['number'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['number'] = number;
    data['logo'] = logo;
    return data;
  }
}
