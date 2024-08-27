class FlashSellModel {
  bool? status;
  String? message;
  Client? client;

  FlashSellModel({this.status, this.message, this.client});

  FlashSellModel.fromJson(Map<String, dynamic> json) {
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
  List<ProductInfo>? productInfo;

  Client({this.productInfo});

  Client.fromJson(Map<String, dynamic> json) {
    if (json['productInfo'] != null) {
      productInfo = <ProductInfo>[];
      json['productInfo'].forEach((v) {
        productInfo!.add(ProductInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productInfo != null) {
      data['productInfo'] = productInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductInfo {
  int? productId;
  String? productName;
  int? productPrice;
  String? productDetailsDes;
  String? productCatId;
  int? sellerId;
  String? sellCount;
  int? quantity;
  String? unit;
  int? discount;
  String? status;
  List<Variant>? variant;
  List<ProductImages>? productImages;

  ProductInfo(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productDetailsDes,
      this.productCatId,
      this.sellerId,
      this.sellCount,
      this.quantity,
      this.unit,
      this.discount,
      this.status,
      this.variant,
      this.productImages});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDetailsDes = json['product_details_des'];
    productCatId = json['product_cat_id'];
    sellerId = json['seller_id'];
    sellCount = json['sell_count'].toString();
    quantity = json['quantity'];
    unit = json['unit'];
    discount = json['discount'];
    status = json['status'];
    if (json['variant'] != null) {
      variant = <Variant>[];
      json['variant'].forEach((v) {
        variant!.add(Variant.fromJson(v));
      });
    }
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
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
    data['quantity'] = quantity;
    data['unit'] = unit;
    data['discount'] = discount;
    data['status'] = status;
    if (variant != null) {
      data['variant'] = variant!.map((v) => v.toJson()).toList();
    }
    if (productImages != null) {
      data['productImages'] = productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variant {
  int? variantId;
  int? productId;
  String? variantName;
  int? price;
  int? variantDiscount;

  Variant(
      {this.variantId,
      this.productId,
      this.variantName,
      this.price,
      this.variantDiscount});

  Variant.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    productId = json['product_id'];
    variantName = json['variant_name'];
    price = json['price'];
    variantDiscount = json['variant_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant_id'] = variantId;
    data['product_id'] = productId;
    data['variant_name'] = variantName;
    data['price'] = price;
    data['variant_discount'] = variantDiscount;
    return data;
  }
}

class ProductImages {
  String? productImageUrl;
  int? featuredImage;

  ProductImages({this.productImageUrl, this.featuredImage});

  ProductImages.fromJson(Map<String, dynamic> json) {
    productImageUrl = json['product_image_url'];
    featuredImage = json['featured_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_image_url'] = productImageUrl;
    data['featured_image'] = featuredImage;
    return data;
  }
}
