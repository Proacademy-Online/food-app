import 'package:flutter/material.dart';
import 'package:food_app/models/objects.dart';

class CategoryProvider extends ChangeNotifier {
  //category list

  final List<CategoryModel> _categoryList = [
    CategoryModel(
      id: "1",
      svgName: 'food',
      categoryName: 'All',
    ),
    CategoryModel(
      id: "2",
      svgName: 'ion_pizza-outline',
      categoryName: 'Pizza',
    ),
    CategoryModel(
      id: "3",
      svgName: 'bx_bx-drink',
      categoryName: 'Beverages',
    ),
    CategoryModel(
      id: "4",
      svgName: 'fe_rice-cracker',
      categoryName: 'Asian',
    ),
    CategoryModel(
      id: "5",
      svgName: 'food',
      categoryName: 'All',
    ),
  ];

  //get category list
  List<CategoryModel> get catList => _categoryList;
}
