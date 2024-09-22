class BookByCategoryModel {
  bool? status;
  List<Books>? books;

  BookByCategoryModel({this.status, this.books});

  BookByCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  String? name;
  String? author;
  String? aboutAuthor;
  String? overview;
  int? price;
  int? catId;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? catName;

  Books(
      {this.id,
      this.name,
      this.author,
      this.aboutAuthor,
      this.overview,
      this.price,
      this.catId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.catName});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    aboutAuthor = json['about_author'];
    overview = json['overview'];
    price = json['price'];
    catId = json['cat_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['author'] = author;
    data['about_author'] = aboutAuthor;
    data['overview'] = overview;
    data['price'] = price;
    data['cat_id'] = catId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cat_name'] = catName;
    return data;
  }
}
