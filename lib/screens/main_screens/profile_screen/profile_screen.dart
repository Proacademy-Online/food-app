import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/components/custom_text.dart';
import 'package:food_app/providers/auth/user_provider.dart';
import 'package:food_app/screens/admin/add_product.dart';
import 'package:food_app/screens/admin/add_restaurents.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Profile Screen',
                fontSize: 25,
              ),
              Consumer<UserProvider>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      CustomText(
                        text: value.userModel.name,
                        fontSize: 20,
                      ),
                      CustomText(
                        text: value.userModel.email,
                        fontSize: 20,
                      ),
                      CustomText(
                        text: value.userModel.phoneNo,
                        fontSize: 20,
                      ),
                    ],
                  );
                },
              ),
              CustomButton(
                onTap: () {
                  Provider.of<UserProvider>(context, listen: false).logout(context);
                },
                text: 'Logout',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  UtilFunctions.navigateTo(context, const AddRestaurent());
                },
                text: 'add restaurent',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  UtilFunctions.navigateTo(context, const AddProduct());
                },
                text: 'add product',
              )
            ],
          ),
        ),
      ),
    );
  }
}
