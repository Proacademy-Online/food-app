import 'package:flutter/material.dart';
import 'package:food_app/providers/auth/user_provider.dart';
import 'package:food_app/screens/splash_screen/getting_started.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Provider.of<UserProvider>(context, listen: false).initializeUser(context);
      // UtilFunctions.navigateTo(context, const GettingStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.imageAsset('food.png')),
            const SizedBox(height: 8),
            const Text(
              "No waiting for food",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff838383),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
