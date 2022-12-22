class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'] ?? "First Name";
    lastName = json['last_name'] ?? "Last Name";
    avatar = json['avatar'] ??
        "https://tse4.mm.bing.net/th?id=OIP.sRMv5YXljZ8OlUcvAZ3lwwHaJ3&pid=Api&P=0";
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['email'] = this.email;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['avatar'] = this.avatar;
  //   return data;
  // }
}
