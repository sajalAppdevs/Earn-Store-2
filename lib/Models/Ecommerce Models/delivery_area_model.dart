class DeliveryAreaModel {
  bool? status;
  String? message;
  List<Charge>? charge;

  DeliveryAreaModel({this.status, this.message, this.charge});

  DeliveryAreaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['charge'] != null) {
      charge = <Charge>[];
      json['charge'].forEach((v) {
        charge!.add(Charge.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (charge != null) {
      data['charge'] = charge!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Charge {
  int? deliveryId;
  String? location;
  int? charge;

  Charge({this.deliveryId, this.location, this.charge});

  Charge.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    location = json['location'];
    charge = json['charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_id'] = deliveryId;
    data['location'] = location;
    data['charge'] = charge;
    return data;
  }
}
