part of 'objects.dart';

@JsonSerializable()
class CategoryModel {
  String id;
  @JsonKey(defaultValue: '')
  String svgName;
  String categoryName;

  CategoryModel({
    required this.id,
    this.svgName = '',
    required this.categoryName,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
