part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  String resId;
  String productId;
  String productName;
  double productPrice;
  double avgRating;
  String img;

  ProductModel({
    required this.resId,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.avgRating,
    required this.img,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
