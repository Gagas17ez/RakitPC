import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Login/login_screen.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/background.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/or_divider.dart';
import 'package:rakit_pc/Login/components/already_have_an_account_acheck.dart';
import 'package:rakit_pc/Login/components/rounded_button.dart';
import 'package:rakit_pc/Login/components/rounded_input_field.dart';
import 'package:rakit_pc/Login/components/rounded_nama_field.dart';
import 'package:rakit_pc/Login/components/rounded_password_field.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rakit_pc/Models/model_user.dart';

import '../../../../../Screen/home_page/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_svg/svg.dart';

class BodyMobile extends StatefulWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  State<BodyMobile> createState() => _BodyMobileState();
}

class _BodyMobileState extends State<BodyMobile> {
  String _email = '', _password = '', _nama = '';
  final auth = FirebaseAuth.instance;
  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/RPC_final.png",
              width: size.width * 0.4,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedNamaField(
              hintText: " Name",
              onChanged: (value) {
                setState(() {
                  _nama = value.trim();
                });
              },
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            RoundedButton(
              color: Colors.black,
              text: "DAFTAR",
              press: () {
                signUp(_email, _password);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            const OrDivider(),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()});
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "weak-password":
          errorMessage = "Password terlalu singkat.";
          break;
        case "email-already-in-use":
          errorMessage = "Akun dengan email ini sudah ada.";
          break;
        case "invalid-email":
          errorMessage = "Email yang dimasukan tidak valid.";
          break;
        case "wrong-password":
          errorMessage = "Password/Email yang dimasukan tidak valid.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "Anda sudah di banned.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;

        default:
          errorMessage = "Semua Kolom input harus diisi.";
          break;
      }
      Fluttertoast.showToast(msg: errorMessage!);
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = _nama;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Akun berhasil dibuat :) ");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  }
}
