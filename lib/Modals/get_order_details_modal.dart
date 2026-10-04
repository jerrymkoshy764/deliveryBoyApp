// class get_order_details_modals {
//   String? status;
//   get_order_detailss? data;

//   get_order_details_modals({this.status, this.data});

//   get_order_details_modals.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new get_order_detailss.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class get_order_detailss {
//   String? orderId;
//   String? customerName;
//   String? address1;
//   String? address2;
//   String? postcode;
//   String? city;
//   String? state;
//   String? country;
//   String? latitude;
//   String? longitude;
//   String? status;
//   String? paymentMethod;
//   String? paymentCode;
//   String? telephone;
//   String? orderPlacedDate;
//   String? timeSlot;
//   String? ratingStatus;
//   String? deilveryCharge;
//   String? couponOffer;
//   String? walletStatus;
//   String? walletAmount;
//   String? cutPrice;
//   String? subtotal;
//   String? total;
//   String? customerId;
//   List<Products>? products;

//   get_order_detailss(
//       {this.orderId,
//       this.customerName,
//       this.address1,
//       this.address2,
//       this.postcode,
//       this.city,
//       this.state,
//       this.country,
//       this.latitude,
//       this.longitude,
//       this.status,
//       this.paymentMethod,
//       this.paymentCode,
//       this.telephone,
//       this.orderPlacedDate,
//       this.timeSlot,
//       this.ratingStatus,
//       this.deilveryCharge,
//       this.couponOffer,
//       this.walletStatus,
//       this.walletAmount,
//       this.cutPrice,
//       this.subtotal,
//       this.total,
//       this.customerId,
//       this.products});

//   get_order_detailss.fromJson(Map<String, dynamic> json) {
//     orderId = json['order_id'];
//     customerName = json['customer_name'];
//     address1 = json['address_1'];
//     address2 = json['address_2'];
//     postcode = json['postcode'];
//     city = json['city'];
//     state = json['state'];
//     country = json['country'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     status = json['status'];
//     paymentMethod = json['payment_method'];
//     paymentCode = json['payment_code'];
//     telephone = json['telephone'];
//     orderPlacedDate = json['order_placed_date'];
//     timeSlot = json['time_slot'];
//     ratingStatus = json['rating_status'];
//     deilveryCharge = json['deilvery_charge'];
//     couponOffer = json['coupon_offer'];
//     walletStatus = json['wallet_status'];
//     walletAmount = json['wallet_amount'];
//     cutPrice = json['cut_price'];
//     subtotal = json['subtotal'];
//     total = json['total'];
//     customerId = json['customer_id'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['order_id'] = this.orderId;
//     data['customer_name'] = this.customerName;
//     data['address_1'] = this.address1;
//     data['address_2'] = this.address2;
//     data['postcode'] = this.postcode;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['status'] = this.status;
//     data['payment_method'] = this.paymentMethod;
//     data['payment_code'] = this.paymentCode;
//     data['telephone'] = this.telephone;
//     data['order_placed_date'] = this.orderPlacedDate;
//     data['time_slot'] = this.timeSlot;
//     data['rating_status'] = this.ratingStatus;
//     data['deilvery_charge'] = this.deilveryCharge;
//     data['coupon_offer'] = this.couponOffer;
//     data['wallet_status'] = this.walletStatus;
//     data['wallet_amount'] = this.walletAmount;
//     data['cut_price'] = this.cutPrice;
//     data['subtotal'] = this.subtotal;
//     data['total'] = this.total;
//     data['customer_id'] = this.customerId;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Products {
//   String? orderProductId;
//   String? orderId;
//   String? productId;
//   String? name;
//   String? model;
//   String? quantity;
//   String? price;
//   String? discountPrice;
//   String? cutPrice;
//   String? sgst;
//   String? cgst;
//   String? cgstPercentage;
//   String? sgstPercentage;
//   String? total;
//   String? tax;
//   String? reward;
//   String? cutId;
//   Null? image;

//   Products(
//       {this.orderProductId,
//       this.orderId,
//       this.productId,
//       this.name,
//       this.model,
//       this.quantity,
//       this.price,
//       this.discountPrice,
//       this.cutPrice,
//       this.sgst,
//       this.cgst,
//       this.cgstPercentage,
//       this.sgstPercentage,
//       this.total,
//       this.tax,
//       this.reward,
//       this.cutId,
//       this.image});

//   Products.fromJson(Map<String, dynamic> json) {
//     orderProductId = json['order_product_id'];
//     orderId = json['order_id'];
//     productId = json['product_id'];
//     name = json['name'];
//     model = json['model'];
//     quantity = json['quantity'];
//     price = json['price'];
//     discountPrice = json['discount_price'];
//     cutPrice = json['cut_price'];
//     sgst = json['sgst'];
//     cgst = json['cgst'];
//     cgstPercentage = json['cgst_percentage'];
//     sgstPercentage = json['sgst_percentage'];
//     total = json['total'];
//     tax = json['tax'];
//     reward = json['reward'];
//     cutId = json['cut_id'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['order_product_id'] = this.orderProductId;
//     data['order_id'] = this.orderId;
//     data['product_id'] = this.productId;
//     data['name'] = this.name;
//     data['model'] = this.model;
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     data['discount_price'] = this.discountPrice;
//     data['cut_price'] = this.cutPrice;
//     data['sgst'] = this.sgst;
//     data['cgst'] = this.cgst;
//     data['cgst_percentage'] = this.cgstPercentage;
//     data['sgst_percentage'] = this.sgstPercentage;
//     data['total'] = this.total;
//     data['tax'] = this.tax;
//     data['reward'] = this.reward;
//     data['cut_id'] = this.cutId;
//     data['image'] = this.image;
//     return data;
//   }
// }








class get_order_details_modals {
  String? status;
  get_order_detailss? data;

 get_order_details_modals({this.status, this.data});

  get_order_details_modals.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new get_order_detailss.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class get_order_detailss {
  String? orderId;
  String? customerName;
  String? address1;
  String? address2;
  String? postcode;
  String? city;
  String? state;
  String? country;
  String? latitude;
  String? longitude;
  String? status;
  String? paymentMethod;
  String? paymentCode;
  String? telephone;
  String? orderPlacedDate;
  String? timeSlot;
  String? ratingStatus;
  String? deilveryCharge;
  String? couponOffer;
  String? walletStatus;
  String? walletAmount;
  String? cutPrice;
  String? subtotal;
  String? total;
  String? customerId;
  List<Products>? products;

  get_order_detailss(
      {this.orderId,
      this.customerName,
      this.address1,
      this.address2,
      this.postcode,
      this.city,
      this.state,
      this.country,
      this.latitude,
      this.longitude,
      this.status,
      this.paymentMethod,
      this.paymentCode,
      this.telephone,
      this.orderPlacedDate,
      this.timeSlot,
      this.ratingStatus,
      this.deilveryCharge,
      this.couponOffer,
      this.walletStatus,
      this.walletAmount,
      this.cutPrice,
      this.subtotal,
      this.total,
      this.customerId,
      this.products});

  get_order_detailss.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerName = json['customer_name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    postcode = json['postcode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    paymentCode = json['payment_code'];
    telephone = json['telephone'];
    orderPlacedDate = json['order_placed_date'];
    timeSlot = json['time_slot'];
    ratingStatus = json['rating_status'];
    deilveryCharge = json['deilvery_charge'];
    couponOffer = json['coupon_offer'];
    walletStatus = json['wallet_status'];
    walletAmount = json['wallet_amount'];
    cutPrice = json['cut_price'];
    subtotal = json['subtotal'];
    total = json['total'];
    customerId = json['customer_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['customer_name'] = this.customerName;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['payment_method'] = this.paymentMethod;
    data['payment_code'] = this.paymentCode;
    data['telephone'] = this.telephone;
    data['order_placed_date'] = this.orderPlacedDate;
    data['time_slot'] = this.timeSlot;
    data['rating_status'] = this.ratingStatus;
    data['deilvery_charge'] = this.deilveryCharge;
    data['coupon_offer'] = this.couponOffer;
    data['wallet_status'] = this.walletStatus;
    data['wallet_amount'] = this.walletAmount;
    data['cut_price'] = this.cutPrice;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['customer_id'] = this.customerId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? orderProductId;
  String? orderId;
  String? productId;
  String? name;
  String? model;
  String? quantity;
  String? price;
  String? discountPrice;
  String? cutPrice;
  String? sgst;
  String? cgst;
  String? cgstPercentage;
  String? sgstPercentage;
  String? total;
  String? tax;
  String? reward;
  String? cutId;
  String? image;

  Products(
      {this.orderProductId,
      this.orderId,
      this.productId,
      this.name,
      this.model,
      this.quantity,
      this.price,
      this.discountPrice,
      this.cutPrice,
      this.sgst,
      this.cgst,
      this.cgstPercentage,
      this.sgstPercentage,
      this.total,
      this.tax,
      this.reward,
      this.cutId,
      this.image});

  Products.fromJson(Map<String, dynamic> json) {
    orderProductId = json['order_product_id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    name = json['name'];
    model = json['model'];
    quantity = json['quantity'];
    price = json['price'];
    discountPrice = json['discount_price'];
    cutPrice = json['cut_price'];
    sgst = json['sgst'];
    cgst = json['cgst'];
    cgstPercentage = json['cgst_percentage'];
    sgstPercentage = json['sgst_percentage'];
    total = json['total'];
    tax = json['tax'];
    reward = json['reward'];
    cutId = json['cut_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_product_id'] = this.orderProductId;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['cut_price'] = this.cutPrice;
    data['sgst'] = this.sgst;
    data['cgst'] = this.cgst;
    data['cgst_percentage'] = this.cgstPercentage;
    data['sgst_percentage'] = this.sgstPercentage;
    data['total'] = this.total;
    data['tax'] = this.tax;
    data['reward'] = this.reward;
    data['cut_id'] = this.cutId;
    data['image'] = this.image;
    return data;
  }
}
