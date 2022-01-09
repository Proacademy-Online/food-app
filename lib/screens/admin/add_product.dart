import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/components/custom_textfeild.dart';
import 'package:food_app/providers/home/product_provider.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FadeInRight(
        child: Container(
          height: size.height,
          color: const Color(0xffE5E5E5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ProductProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        value.getImg.path != ''
                            ? Center(
                                child: GestureDetector(
                                  onTap: () {
                                    value.selectImage();
                                  },
                                  child: Image.file(
                                    value.getImg,
                                    fit: BoxFit.fill,
                                    width: size.width / 3,
                                    height: size.width / 3,
                                  ),
                                ),
                              )
                            : Center(
                                child: IconButton(
                                  onPressed: () {
                                    value.selectImage();
                                  },
                                  icon: const Icon(Icons.image),
                                ),
                              ),
                        const SizedBox(height: 20),
                        CustomTextfeild(
                          controller: value.resIdController,
                          hintText: 'restaurent Id',
                        ),
                        const SizedBox(height: 20),
                        CustomTextfeild(
                          controller: value.nameController,
                          hintText: 'ProductName',
                        ),
                        const SizedBox(height: 20),
                        CustomTextfeild(
                          controller: value.priceController,
                          hintText: 'productPrice',
                        ),
                        const SizedBox(height: 35),
                        CustomButton(
                          text: "save",
                          isLoading: value.isLoading,
                          onTap: () {
                            value.startAddProduct(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
