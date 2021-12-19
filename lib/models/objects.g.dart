// GENERATED CODE - DO NOT MODIFY BY HAND

part of objects;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as String,
      svgName: json['svgName'] as String? ?? '',
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'svgName': instance.svgName,
      'categoryName': instance.categoryName,
    };

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      addressString: json['addressString'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'addressString': instance.addressString,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      phoneNo: json['phone'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'phone': instance.phoneNo,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address?.toJson(),
    };
