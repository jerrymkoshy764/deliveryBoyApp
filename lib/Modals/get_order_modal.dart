// class get_order_modal {
//   String? status;
//   String? notificationCount;
//   List<get_order>? data;

//   get_order_modal({this.status, this.notificationCount, this.data});

//   get_order_modal.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     notificationCount = json['notification_count'];
//     if (json['data'] != null) {
//       data = <get_order>[];
//       json['data'].forEach((v) {
//         data!.add(new get_order.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['notification_count'] = this.notificationCount;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class get_order {
//   String? image;
//   String? orderId;
//   String? paymentMethod;
//   String? walletStatus;
//   String? walletAmount;
//   String? total;
//   String? producName;
//   String? producModel;
//   Null? cutName;
//   String? timeSlot;
//   String? status;

//   get_order(
//       {this.image,
//       this.orderId,
//       this.paymentMethod,
//       this.walletStatus,
//       this.walletAmount,
//       this.total,
//       this.producName,
//       this.producModel,
//       this.cutName,
//       this.timeSlot,
//       this.status});

//   get_order.fromJson(Map<String, dynamic> json) {
//     image = json['image'];
//     orderId = json['order_id'];
//     paymentMethod = json['payment_method'];
//     walletStatus = json['wallet_status'];
//     walletAmount = json['wallet_amount'];
//     total = json['total'];
//     producName = json['produc_name'];
//     producModel = json['produc_model'];
//     cutName = json['cut_name'];
//     timeSlot = json['time_slot'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['image'] = this.image;
//     data['order_id'] = this.orderId;
//     data['payment_method'] = this.paymentMethod;
//     data['wallet_status'] = this.walletStatus;
//     data['wallet_amount'] = this.walletAmount;
//     data['total'] = this.total;
//     data['produc_name'] = this.producName;
//     data['produc_model'] = this.producModel;
//     data['cut_name'] = this.cutName;
//     data['time_slot'] = this.timeSlot;
//     data['status'] = this.status;
//     return data;
//   }
// }



class get_order_modals {
  String? status;
  String? notificationCount;
  List<get_orders>? data;

  get_order_modals({this.status, this.notificationCount, this.data});

  get_order_modals.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    notificationCount = json['notification_count'];
    if (json['data'] != null) {
      data = <get_orders>[];
      json['data'].forEach((v) {
        data!.add(new get_orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['notification_count'] = this.notificationCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class get_orders {
  String? image;
  String? orderId;
  String? paymentMethod;
  String? walletStatus;
  String? walletAmount;
  String? total;
  String? producName;
  String? producModel;
  String? cutName;
  String? timeSlot;
  String? status;

  get_orders(
      {this.image,
      this.orderId,
      this.paymentMethod,
      this.walletStatus,
      this.walletAmount,
      this.total,
      this.producName,
      this.producModel,
      this.cutName,
      this.timeSlot,
      this.status});

  get_orders.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    orderId = json['order_id'];
    paymentMethod = json['payment_method'];
    walletStatus = json['wallet_status'];
    walletAmount = json['wallet_amount'];
    total = json['total'];
    producName = json['produc_name'];
    producModel = json['produc_model'];
    cutName = json['cut_name'];
    timeSlot = json['time_slot'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['order_id'] = this.orderId;
    data['payment_method'] = this.paymentMethod;
    data['wallet_status'] = this.walletStatus;
    data['wallet_amount'] = this.walletAmount;
    data['total'] = this.total;
    data['produc_name'] = this.producName;
    data['produc_model'] = this.producModel;
    data['cut_name'] = this.cutName;
    data['time_slot'] = this.timeSlot;
    data['status'] = this.status;
    return data;
  }
}
