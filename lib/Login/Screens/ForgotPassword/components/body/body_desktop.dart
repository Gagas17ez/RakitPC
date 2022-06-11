import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rakit_pc/Login/Screens/ForgotPassword/components/background.dart';
import 'package:rakit_pc/Login/components/rounded_button.dart';
import 'package:rakit_pc/Login/components/rounded_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../Screen/home_page/homepage.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class BodyDesktop extends StatefulWidget {
  const BodyDesktop({Key? key}) : super(key: key);

  @override
  State<BodyDesktop> createState() => _BodyDesktopState();
}

class _BodyDesktopState extends State<BodyDesktop> {
  String _email = '', _status = '';
  final auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: Responsive.isDesktop(context) ? 2 : 1,
            //   child: SvgPicture.asset(
            //     "assets/icons/login.svg",
            //     height: size.height * 0.45,
            //   ),
            // ),
            SizedBox(
              width: size.height * 0.1,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/RPC_final.png",
                    width: size.width * 0.4,
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(hintText: "Email", onChanged: (value) {}),
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
      //print(_status);
      Fluttertoast.showToast(msg: 'Password reset has been sent to Email ');
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        default:
          errorMessage = "Coulumn need to be filled.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}
