// part of 'objects.dart';

// @JsonSerializable(explicitToJson: true)
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurentModel {
  late String resId;
  late String resName;
  late String about;
  late double avgRating;
  late GeoPoint position;
  late String img;

  RestaurentModel({
    required this.resId,
    required this.resName,
    required this.about,
    required this.avgRating,
    required this.position,
    required this.img,
  });

  // factory RestaurentModel.fromJson(Map<String, dynamic> json) => _$RestaurentModelFromJson(json);

  // Map<String, dynamic> toJson() => _$RestaurentModelToJson(this);

  RestaurentModel.fromJson(Map map) {
    resId = map['resId'];
    resName = map['resName'];
    about = map['about'];
    avgRating = map['avgRating'];
    position = map['position']['geopoint'];
    img = map['img'];
  }
}
