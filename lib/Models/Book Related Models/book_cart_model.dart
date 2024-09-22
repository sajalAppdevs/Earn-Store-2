class BookCartModel {
  bool? status;
  String? message;
  Client? client;

  BookCartModel({this.status, this.message, this.client});

  BookCartModel.fromJson(Map<String, dynamic> json) {
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
  List<CartInfo>? cartInfo;

  Client({this.cartInfo});

  Client.fromJson(Map<String, dynamic> json) {
    if (json['cartInfo'] != null) {
      cartInfo = <CartInfo>[];
      json['cartInfo'].forEach((v) {
        cartInfo!.add(CartInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartInfo != null) {
      data['cartInfo'] = cartInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartInfo {
  int? bookId;
  String? bookName;
  int? bookPrice;
  String? bookImage;
  int? orderDetailsId;
  int? productTotalPrice;
  int? productQuantity;
  int? stockOut;
  int? orderId;
  int? orderStatus;
  String? placedDate;
  String? deliveryDate;
  int? inCart;
  int? isPaid;
  int? deliveryCharge;
  String? address;

  CartInfo(
      {this.bookId,
      this.bookName,
      this.bookPrice,
      this.bookImage,
      this.orderDetailsId,
      this.productTotalPrice,
      this.productQuantity,
      this.stockOut,
      this.orderId,
      this.orderStatus,
      this.placedDate,
      this.deliveryDate,
      this.inCart,
      this.isPaid,
      this.deliveryCharge,
      this.address});

  CartInfo.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookName = json['book_name'];
    bookPrice = json['book_price'];
    bookImage = json['book_image'];
    orderDetailsId = json['order_details_id'];
    productTotalPrice = json['product_total_price'];
    productQuantity = json['product_quantity'];
    stockOut = json['stock_out'];
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    placedDate = json['placed_date'];
    deliveryDate = json['delivery_date'].toString();
    inCart = json['in_cart'];
    isPaid = json['is_paid'];
    deliveryCharge = json['deliveryCharge'];
    address = json['address'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_name'] = bookName;
    data['book_price'] = bookPrice;
    data['book_image'] = bookImage;
    data['order_details_id'] = orderDetailsId;
    data['product_total_price'] = productTotalPrice;
    data['product_quantity'] = productQuantity;
    data['stock_out'] = stockOut;
    data['order_id'] = orderId;
    data['order_status'] = orderStatus;
    data['placed_date'] = placedDate;
    data['delivery_date'] = deliveryDate;
    data['in_cart'] = inCart;
    data['is_paid'] = isPaid;
    data['deliveryCharge'] = deliveryCharge;
    data['address'] = address;
    return data;
  }
}
