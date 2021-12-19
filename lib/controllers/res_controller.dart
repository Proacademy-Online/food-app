import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_app/utils/constants.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class ResController {
  // Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //geoflutterfire instance
  Geoflutterfire geo = Geoflutterfire();

  // Create a collection refferance
  CollectionReference res = FirebaseFirestore.instance.collection('restaurents');

  Future<void> saveResData(
    String resName,
    double lat,
    double lng,
    File img,
  ) async {
    //uploading image task
    UploadTask? task = uploadFile(img);
    final snapshot = await task!.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    Logger().i(downloadUrl);

    //get the unique document id auto generated
    String docId = res.doc().id;

    GeoFirePoint point = geo.point(latitude: lat, longitude: lng);

    await res.doc(docId).set({
      'resId': docId,
      'resName': resName,
      'about': Constants.DUMMY_DESC,
      'avgRating': 0.0,
      'position': point.data,
      'img': downloadUrl,
    });
  }

//upload image to the db
  UploadTask? uploadFile(File file) {
    try {
      final fileName = basename(file.path);
      final destination = 'resImages/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
