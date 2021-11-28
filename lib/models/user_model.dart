class UserModel {
  late String uid;
  late String phoneNo;
  late String name;
  late String email;

  UserModel({
    required this.uid,
    required this.phoneNo,
    required this.name,
    required this.email,
  });

  UserModel.fromMap(Map map) {
    uid = map['uid'];
    phoneNo = map['phone'];
    name = map['name'];
    email = map['email'];
  }
}
