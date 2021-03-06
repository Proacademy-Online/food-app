import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/components/custom_dialogbox.dart';
import 'package:food_app/controllers/db_controller.dart';

class AuthController {
  // Firebase auth instance created
  FirebaseAuth auth = FirebaseAuth.instance;

  // User registration function
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user!.uid.isNotEmpty) {
        await DatabaseController().saveUserData(name, phone, email, userCredential.user!.uid);
      }

      DialogBox().dialogBox(
        context,
        DialogType.SUCCES,
        'User Account created.',
        'Congratulations, Now you can log in.',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The password provided is too weak.',
          'Please enter valid password.',
        );
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The account already exists for that email.',
          'Please enter valid email.',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // User login Function
  Future<void> loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      // if (userCredential.user != null) {
      //   UtilFunctions.pushRemoveNavigation(context, const MainScreen());
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'No user found for that email.',
          'Please enter valid email.',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'Wrong password provided for that user.',
          'Please enter valid password.',
        );
      }
    }
  }

  // Send password reset email function
  Future<void>? sendPasswordResetEmail(BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'Invalid email.',
          'Please enter valid email.',
        );
      } else {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'ERROR.',
          e.toString(),
        );
      }
    } catch (e) {}
  }
}
