import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/ForgotPassword/components/background.dart';
import 'package:rakit_pc/Login/Screens/Login/login_screen.dart';
import 'package:rakit_pc/Login/components/rounded_button.dart';
import 'package:rakit_pc/Login/components/rounded_input_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter_svg/svg.dart';
// import 'package:firebase_core/firebase_core.dart';

class BodyMobile extends StatefulWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  State<BodyMobile> createState() => _BodyMobileState();
}

class _BodyMobileState extends State<BodyMobile> {
  final auth = FirebaseAuth.instance;
  String _email = '', _status = '';
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
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
                hintText: "Email",
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                }),
            RoundedButton(
              text: "Reset Password",
              color: Colors.black,
              press: () {
                resetPassword(email: _email);
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  void resetPassword({required String email}) async {
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .then((value) => _status = ' successful');
      print(_status);
      // Fluttertoast.showToast(msg: 'Password reset has been sent to Email ');
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
      );
      AlertDialog alert = AlertDialog(
        title: Text("Notice"),
        content: Text(
            "Password reset sudah terkirim ke email, jika belum diterima cek folder spam"),
        actions: [
          okButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Email yang dimasukan tidak valid.";
          break;
        case "user-not-found":
          errorMessage = "User dengan email tersebut tidak ditemukan.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        default:
          errorMessage = "Kolom email harus diisi.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}
