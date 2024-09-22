class ProductByCategoryModel {
  bool? status;
  String? message;
  Client? client;

  ProductByCategoryModel({this.status, this.message, this.client});

  ProductByCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    client =
        json['client'] != null ? Client.fromJson(json['client']) : null;
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
  int? sellCount;
  int? quantity;
  String? unit;
  int? discount;
  int? status;
  int? variant;
  List<FeaturedImages>? featuredImages;
  List<Variants>? variants;

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
      this.featuredImages,
      this.variants});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDetailsDes = json['product_details_des'];
    productCatId = json['product_cat_id'];
    sellerId = json['seller_id'];
    sellCount = json['sell_count'];
    quantity = json['quantity'];
    unit = json['unit'];
    discount = json['discount'];
    status = json['status'];
    variant = json['variant'];
    if (json['featuredImages'] != null) {
      featuredImages = <FeaturedImages>[];
      json['featuredImages'].forEach((v) {
        featuredImages!.add(FeaturedImages.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
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
    data['variant'] = variant;
    if (featuredImages != null) {
      data['featuredImages'] =
          featuredImages!.map((v) => v.toJson()).toList();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedImages {
  int? id;
  int? productId;
  String? productImageUrl;
  int? featuredImage;

  FeaturedImages(
      {this.id, this.productId, this.productImageUrl, this.featuredImage});

  FeaturedImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productImageUrl = json['product_image_url'];
    featuredImage = json['featured_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_image_url'] = productImageUrl;
    data['featured_image'] = featuredImage;
    return data;
  }
}

class Variants {
  int? variantId;
  int? productId;
  String? variantName;
  int? price;
  int? variantDiscount;

  Variants(
      {this.variantId,
      this.productId,
      this.variantName,
      this.price,
      this.variantDiscount});

  Variants.fromJson(Map<String, dynamic> json) {
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
