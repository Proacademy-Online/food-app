import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_app/models/objects.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class ProductController {
  // Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a collection refferance
  CollectionReference products = FirebaseFirestore.instance.collection('products');

  Future<void> saveProductData(
    String resId,
    String productName,
    double productPrice,
    File img,
  ) async {
    //uploading image task
    UploadTask? task = uploadFile(img);
    final snapshot = await task!.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    Logger().i(downloadUrl);

    //get the unique document id auto generated
    String docId = products.doc().id;

    await products.doc(docId).set({
      'productId': docId,
      'resId': 'he5YMVfyWcZ5bsKDXEdX',
      'productName': productName,
      'productPrice': productPrice,
      'avgRating': 0.0,
      'img': downloadUrl,
    });
  }

//upload image to the db
  UploadTask? uploadFile(File file) {
    try {
      final fileName = basename(file.path);
      final destination = 'productImages/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //fetch products by the restaurent id
  Future<List<ProductModel>> getProducts(String resid) async {
    List<ProductModel> list = [];
    try {
      //query for fetch relevent products
      QuerySnapshot snapshot = await products.where('resId', isEqualTo: resid).get();

      //querying all the docs in this snapshot
      for (var item in snapshot.docs) {
        // mapping to a single model
        ProductModel model = ProductModel.fromJson(item.data() as Map<String, dynamic>);
        //ading to the model
        list.add(model);
      }

      //returning the list
      return list;
    } catch (e) {
      Logger().e(e);
      return list;
    }
  }
}
