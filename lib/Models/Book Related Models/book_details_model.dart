class BookDetailsModel {
  bool? status;
  List<Book>? book;

  BookDetailsModel({this.status, this.book});

  BookDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['book'] != null) {
      book = <Book>[];
      json['book'].forEach((v) {
        book!.add(Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (book != null) {
      data['book'] = book!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
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

  Book(
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

  Book.fromJson(Map<String, dynamic> json) {
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
