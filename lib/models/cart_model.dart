part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class CartModel {
  String id;
  int amount;
  ProductModel productModel;

  CartModel({
    required this.id,
    required this.amount,
    required this.productModel,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
