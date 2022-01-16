part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  String uid;
  @JsonKey(name: "phone")
  String phoneNo;
  String name;
  String email;
  AddressModel? address;
  List<CartModel> cartItems;

  UserModel({
    required this.uid,
    required this.phoneNo,
    required this.name,
    required this.email,
    this.address,
    required this.cartItems,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // UserModel.fromMap(Map map) {
  //   uid = map['uid'];
  //   phoneNo = map['phone'];
  //   name = map['name'];
  //   email = map['email'];
  // }
}
