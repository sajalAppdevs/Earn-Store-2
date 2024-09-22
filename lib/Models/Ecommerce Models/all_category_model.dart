class AllCategoryModel {
  bool? status;
  String? message;
  Client? client;

  AllCategoryModel({this.status, this.message, this.client});

  AllCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    return data;
  }
}

class Client {
  List<MainCat>? mainCat;
  List<SubCat>? subCat;
  List<ExtraCat>? extraCat;

  Client({this.mainCat, this.subCat, this.extraCat});

  Client.fromJson(Map<String, dynamic> json) {
    if (json['mainCat'] != null) {
      mainCat = <MainCat>[];
      json['mainCat'].forEach((v) {
        mainCat!.add(MainCat.fromJson(v));
      });
    }
    if (json['subCat'] != null) {
      subCat = <SubCat>[];
      json['subCat'].forEach((v) {
        subCat!.add(SubCat.fromJson(v));
      });
    }
    if (json['extraCat'] != null) {
      extraCat = <ExtraCat>[];
      json['extraCat'].forEach((v) {
        extraCat!.add(ExtraCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mainCat != null) {
      data['mainCat'] = mainCat!.map((v) => v.toJson()).toList();
    }
    if (subCat != null) {
      data['subCat'] = subCat!.map((v) => v.toJson()).toList();
    }
    if (extraCat != null) {
      data['extraCat'] = extraCat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainCat {
  int? mainCatId;
  String? mainCatName;
  String? mainCatImageUrl;
  String? popularCatValue;

  MainCat({
    this.mainCatId,
    this.mainCatName,
    this.mainCatImageUrl,
    this.popularCatValue,
  });

  MainCat.fromJson(Map<String, dynamic> json) {
    mainCatId = json['main_cat_id'];
    mainCatName = json['main_cat_name'];
    mainCatImageUrl = json['main_cat_image_url'];
    popularCatValue = json['popular_cat_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main_cat_id'] = mainCatId;
    data['main_cat_name'] = mainCatName;
    data['main_cat_image_url'] = mainCatImageUrl;
    data['popular_cat_value'] = popularCatValue.toString();
    return data;
  }
}

class SubCat {
  int? subCatId;
  String? subCatRef;
  String? subCatName;
  String? subCatImageUrl;
  String? popularCatValue;

  SubCat(
      {this.subCatId,
      this.subCatRef,
      this.subCatName,
      this.subCatImageUrl,
      this.popularCatValue});

  SubCat.fromJson(Map<String, dynamic> json) {
    subCatId = json['sub_cat_id'];
    subCatRef = json['sub_cat_ref'];
    subCatName = json['sub_cat_name'];
    subCatImageUrl = json['sub_cat_image_url'];
    popularCatValue = json['popular_cat_value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_cat_id'] = subCatId;
    data['sub_cat_ref'] = subCatRef;
    data['sub_cat_name'] = subCatName;
    data['sub_cat_image_url'] = subCatImageUrl;
    data['popular_cat_value'] = popularCatValue;
    return data;
  }
}

class ExtraCat {
  int? extraCatId;
  String? extraCatRef;
  String? extraCatName;
  String? extraCatImageUrl;
  String? popularCatValue;

  ExtraCat({
    this.extraCatId,
    this.extraCatRef,
    this.extraCatName,
    this.extraCatImageUrl,
    this.popularCatValue,
  });

  ExtraCat.fromJson(Map<String, dynamic> json) {
    extraCatId = json['extra_cat_id'];
    extraCatRef = json['extra_cat_ref'];
    extraCatName = json['extra_cat_name'];
    extraCatImageUrl = json['extra_cat_image_url'];
    popularCatValue = json['popular_cat_value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extra_cat_id'] = extraCatId;
    data['extra_cat_ref'] = extraCatRef;
    data['extra_cat_name'] = extraCatName;
    data['extra_cat_image_url'] = extraCatImageUrl;
    data['popular_cat_value'] = popularCatValue;
    return data;
  }
}
