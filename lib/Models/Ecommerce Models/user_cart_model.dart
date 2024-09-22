class UserCartModel {
  bool? status;
  String? message;
  Client? client;

  UserCartModel({this.status, this.message, this.client});

  UserCartModel.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  String? productName;
  int? productPrice;
  String? productDetailsDes;
  String? productCatId;
  int? sellerId;
  String? sellCount;
  int? discount;
  int? isVariant;
  String? variantId;
  String? variantName;
  String? variantPrice;
  String? variantDiscount;
  ProductImage? productImage;
  ExtraCat? extraCat;
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
  String? address;

  CartInfo(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productDetailsDes,
      this.productCatId,
      this.sellerId,
      this.sellCount,
      this.discount,
      this.isVariant,
      this.variantId,
      this.variantName,
      this.variantPrice,
      this.variantDiscount,
      this.productImage,
      this.extraCat,
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
      this.address});

  CartInfo.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDetailsDes = json['product_details_des'];
    productCatId = json['product_cat_id'];
    sellerId = json['seller_id'];
    sellCount = json['sell_count'].toString();
    discount = json['discount'];
    isVariant = json['is_variant'];
    variantId = json['variant_id'].toString();
    variantName = json['variant_name'].toString();
    variantPrice = json['variant_price'].toString();
    variantDiscount = json['variant_discount'].toString();
    productImage = json['product_image'] != null
        ? ProductImage.fromJson(json['product_image'])
        : null;
    extraCat =
        json['extra_cat'] != null ? ExtraCat.fromJson(json['extra_cat']) : null;
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
    address = json['address'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_details_des'] = productDetailsDes;
    data['product_cat_id'] = productCatId;
    data['seller_id'] = sellerId;
    data['sell_count'] = sellCount;
    data['discount'] = discount;
    data['is_variant'] = isVariant;
    data['variant_id'] = variantId;
    data['variant_name'] = variantName;
    data['variant_price'] = variantPrice;
    data['variant_discount'] = variantDiscount;
    if (productImage != null) {
      data['product_image'] = productImage!.toJson();
    }
    if (extraCat != null) {
      data['extra_cat'] = extraCat!.toJson();
    }
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
    data['address'] = address;
    return data;
  }
}

class ProductImage {
  String? featuredImageUrl;

  ProductImage({this.featuredImageUrl});

  ProductImage.fromJson(Map<String, dynamic> json) {
    featuredImageUrl = json['featured_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['featured_image_url'] = featuredImageUrl;
    return data;
  }
}

class ExtraCat {
  int? extraCatId;
  String? extraCatName;
  String? extraCatImageUrl;
  String? extraCatRef;

  ExtraCat(
      {this.extraCatId,
      this.extraCatName,
      this.extraCatImageUrl,
      this.extraCatRef});

  ExtraCat.fromJson(Map<String, dynamic> json) {
    extraCatId = json['extra_cat_id'];
    extraCatName = json['extra_cat_name'];
    extraCatImageUrl = json['extra_cat_image_url'];
    extraCatRef = json['extra_cat_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extra_cat_id'] = extraCatId;
    data['extra_cat_name'] = extraCatName;
    data['extra_cat_image_url'] = extraCatImageUrl;
    data['extra_cat_ref'] = extraCatRef;
    return data;
  }
}
