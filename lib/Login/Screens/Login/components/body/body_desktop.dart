import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Login/components/background.dart';
import 'package:rakit_pc/Login/Screens/Signup/signup_screen.dart';
import 'package:rakit_pc/Login/components/already_have_an_account_acheck.dart';
import 'package:rakit_pc/Login/components/rounded_button.dart';
import 'package:rakit_pc/Login/components/rounded_input_field.dart';
import 'package:rakit_pc/Login/components/rounded_password_field.dart';
import 'package:rakit_pc/Login/responsive/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../Screen/home_page/homepage.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class BodyDesktop extends StatefulWidget {
  const BodyDesktop({Key? key}) : super(key: key);

  @override
  State<BodyDesktop> createState() => _BodyDesktopState();
}

class _BodyDesktopState extends State<BodyDesktop> {
  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
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
                  RoundedInputField(
                    hintText: "Your Email",
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
                    text: "LOGIN",
                    press: () async {
                      final SharedPreferences login =
                          await SharedPreferences.getInstance();
                      login.setString('email', _email);
                      auth
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => homepage()),
                            (Route<dynamic> route) => false);
                      });
                    },
                    height: size.height * 0.07,
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
class BodyDesktop extends StatelessWidget {
  BodyDesktop({Key? key}) : super(key: key);

  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
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
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {
                      _email = value.trim();
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      _password = value.trim();
                    },
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () async {
                      final SharedPreferences login =
                          await SharedPreferences.getInstance();
                      login.setString('email', _email);
                      auth
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => homepage()));
                      });
                    },
                    height: size.height * 0.07,
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */