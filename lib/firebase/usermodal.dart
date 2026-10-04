// class UserModel {
//   String? name;
//   int? age;

//   UserModel({this.name, this.age});

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         name: json['name'] as String?,
//         age: json['age'] as int?,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'age': age,
//       };
// }

// class UserModel {
//   String? user_nme;
//   String? pass;

//   UserModel({this.user_nme, this.pass});

//   UserModel.fromJson(Map<dynamic, dynamic> json) {
//     user_nme = json['name'];
//     pass = json['age'];
//   }

//   Map<String, dynamic> toJson() => {
//         'username': user_nme,
//         'password': pass,
//       };
// }

// class NewUserModel {
//   String? key;
//   UserModel? model;

//   NewUserModel({this.key, this.model});
// }

//*******login data******** */

class UserModel {
  String? user_nme;
  String? pass;
  String? did;
  String? names;
   String? mob;


  UserModel({this.user_nme, this.pass, this.did, this.names,this.mob});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    user_nme = json['username'];
    pass = json['password'];
    names = json['name'];
    did = json['did'];
     mob = json['mob'];
  }

  Map<String, dynamic> toJson() => {
        'username': user_nme,
        'password': pass,
        'name': names,
        'did': did,
        'mob':mob
      };
}

class NewUserModel {
  String? key;
  UserModel? model;

  NewUserModel({this.key, this.model});
}

//*******Performance data******** */
class Performance {
  int? earn;
  int? did;

  // String? password;
  int? sec;
  int? min;
  int? hours;
  int? Float_cash;
  int? order_count;

  Performance(
      {this.earn,
      this.did,
      this.sec,
      this.min,
      this.hours,
      this.Float_cash,
      this.order_count});

  Performance.fromJson(Map<dynamic, dynamic> json) {
    earn = json['earn'];
    did = json['did'];
    sec = json['sec'];
    min = json['min'];
    hours = json['hours'];
    Float_cash = json['floating_cash'];
    order_count = json['order_count'];
    // password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'earn': earn,
        'did': did,
        'sec': sec,
        'min': min,
        'hours': hours,
        'floating_cash': Float_cash,
        'order_count': order_count,
      };
}

//*******oders data******** */

class Orders_modal {
  String? boy_id;
  String? order_id;
  String? status;

  Orders_modal({this.boy_id, this.order_id, this.status});

  Orders_modal.fromJson(Map<dynamic, dynamic> json) {
    boy_id = json['boy_id'];
    order_id = json['order_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() => {
        'boy_id': boy_id,
        'order_id': order_id,
        'status': status,
      };
}

class History_orders_modal {
  String? date;
  int? count;

  History_orders_modal({this.count, this.date});

  History_orders_modal.fromJson(Map<dynamic, dynamic> json) {
    date = json['date'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'count': count,
      };
}




class History_Earnings_modal {
  String? date;
  int? count;

   History_Earnings_modal ({this.count, this.date});

   History_Earnings_modal .fromJson(Map<dynamic, dynamic> json) {
    date = json['date'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'count': count,
      };
}
