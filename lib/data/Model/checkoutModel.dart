class checkoutModel {
  Address? address;
  String? status;
  String? sId;
  String? user;
  String? delevieryZoneId;
  String? zoneEn;
  String? zoneAr;
  String? addressId;
  int? totalItemsPrice;
  int? delevieryPrice;
  int? delevieryTimeInDays;
  String? paymentMethod;
  List<Items>? items;
  String? couponId;
  Coupon? coupon;
  String? createdAt;
  String? updatedAt;
  int? totalPrice;
  int? iV;

  checkoutModel(
      {this.address,
      this.status,
      this.sId,
      this.user,
      this.delevieryZoneId,
      this.zoneEn,
      this.zoneAr,
      this.addressId,
      this.totalItemsPrice,
      this.delevieryPrice,
      this.delevieryTimeInDays,
      this.paymentMethod,
      this.items,
      this.couponId,
      this.coupon,
      this.createdAt,
      this.updatedAt,
      this.totalPrice,
      this.iV});

  checkoutModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    status = json['status'];
    sId = json['_id'];
    user = json['user'];
    delevieryZoneId = json['delevieryZoneId'];
    zoneEn = json['zoneEn'];
    zoneAr = json['zoneAr'];
    addressId = json['addressId'];
    totalItemsPrice = json['totalItemsPrice'];
    delevieryPrice = json['delevieryPrice'];
    delevieryTimeInDays = json['delevieryTimeInDays'];
    paymentMethod = json['paymentMethod'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    couponId = json['couponId'];
    coupon =
        json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalPrice = json['totalPrice'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['delevieryZoneId'] = this.delevieryZoneId;
    data['zoneEn'] = this.zoneEn;
    data['zoneAr'] = this.zoneAr;
    data['addressId'] = this.addressId;
    data['totalItemsPrice'] = this.totalItemsPrice;
    data['delevieryPrice'] = this.delevieryPrice;
    data['delevieryTimeInDays'] = this.delevieryTimeInDays;
    data['paymentMethod'] = this.paymentMethod;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['couponId'] = this.couponId;
    if (this.coupon != null) {
      data['coupon'] = this.coupon!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['totalPrice'] = this.totalPrice;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  String? type;
  List<double>? coordinates;
  String? name;
  String? city;
  String? street;
  int? buildingNumber;
  int? floorNumber;
  int? apartmentNumber;

  Address(
      {this.type,
      this.coordinates,
      this.name,
      this.city,
      this.street,
      this.buildingNumber,
      this.floorNumber,
      this.apartmentNumber});

  Address.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    name = json['name'];
    city = json['city'];
    street = json['street'];
    buildingNumber = json['buildingNumber'];
    floorNumber = json['floorNumber'];
    apartmentNumber = json['apartmentNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['name'] = this.name;
    data['city'] = this.city;
    data['street'] = this.street;
    data['buildingNumber'] = this.buildingNumber;
    data['floorNumber'] = this.floorNumber;
    data['apartmentNumber'] = this.apartmentNumber;
    return data;
  }
}

class Items {
  int? discount;
  String? sId;
  SelectedVariation? selectedVariation;
  String? product;
  String? productName;
  String? productDescription;
  int? quantity;
  int? price;

  Items(
      {this.discount,
      this.sId,
      this.selectedVariation,
      this.product,
      this.productName,
      this.productDescription,
      this.quantity,
      this.price});

  Items.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    sId = json['_id'];
    selectedVariation = json['selectedVariation'] != null
        ? new SelectedVariation.fromJson(json['selectedVariation'])
        : null;
    product = json['product'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['_id'] = this.sId;
    if (this.selectedVariation != null) {
      data['selectedVariation'] = this.selectedVariation!.toJson();
    }
    data['product'] = this.product;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}

class SelectedVariation {
  String? variationId;
  String? color;
  String? size;

  SelectedVariation({this.variationId, this.color, this.size});

  SelectedVariation.fromJson(Map<String, dynamic> json) {
    variationId = json['variationId'];
    color = json['color'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variationId'] = this.variationId;
    data['color'] = this.color;
    data['size'] = this.size;
    return data;
  }
}

class Coupon {
  String? name;
  int? discount;

  Coupon({this.name, this.discount});

  Coupon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['discount'] = this.discount;
    return data;
  }
}
