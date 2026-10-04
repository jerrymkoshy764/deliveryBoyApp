

class FirebaseModel {
   String? did;
  String? name;
  String? username;
  String? password;
  // String? key;

  FirebaseModel({this.username, this.password,this.did,this.name});

  FirebaseModel.fromJson(Map<dynamic, dynamic> json) {
     did = json['did'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}



class FirebaseModel1 {
  int? earn;
  int? status;
  // String? password;
  // String? key;

  FirebaseModel1({this.earn,this.status});

  FirebaseModel1.fromJson(Map<dynamic, dynamic> json) {
    earn = json['earn'];
    status=json['did'];
    // password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'name': earn,
        'age': status,
      };
}