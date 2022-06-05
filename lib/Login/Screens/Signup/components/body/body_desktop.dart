import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Login/login_screen.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/background.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/or_divider.dart';
import 'package:rakit_pc/Login/components/already_have_an_account_acheck.dart';
import 'package:rakit_pc/Login/components/rounded_button.dart';
import 'package:rakit_pc/Login/components/rounded_input_field.dart';
import 'package:rakit_pc/Login/components/rounded_password_field.dart';
import 'package:rakit_pc/Login/responsive/responsive.dart';

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
          horizontal: Responsive.isDesktop(context)
              ? size.width * 0.12
              : size.width * 0.07,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: Responsive.isDesktop(context) ? 2 : 1,
            //   // child: SvgPicture.asset(
            //   //   "assets/icons/signup.svg",
            //   //   height: size.height * 0.5,
            //   // ),
            // ),
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
                    text: "SIGNUP",
                    press: () {
                      auth
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      });
                    },
                    height: size.height * 0.07,
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
            )
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
          horizontal: Responsive.isDesktop(context)
              ? size.width * 0.12
              : size.width * 0.07,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //   flex: Responsive.isDesktop(context) ? 2 : 1,
            //   // child: SvgPicture.asset(
            //   //   "assets/icons/signup.svg",
            //   //   height: size.height * 0.5,
            //   // ),
            // ),
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
                    text: "SIGNUP",
                    press: () {},
                    height: size.height * 0.07,
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      auth
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      });
                    },
                  ),
                  const OrDivider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 */
